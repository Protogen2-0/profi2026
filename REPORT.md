# Отчёт по анализу ошибок и план решения для фронтенда

## 1. Резюме проблемы (Executive Summary)

В ходе анализа логов из `log.txt` и кодовой базы проекта (каталог `front/`) были выявлены критические архитектурные и синтаксические ошибки. 

Главная ошибка, вызвавшая сбой в `log.txt`:
```text
Contract.jsx:70 Uncaught (in promise) TypeError: Cannot read properties of undefined (reading 'getUserVault')
Contract.jsx:74 Uncaught (in promise) TypeError: Cannot read properties of undefined (reading 'getUserMarket')
```
Она вызвана **попыткой выполнить асинхронную инициализацию внутри синхронного конструктора JavaScript-класса** в связке с `ethers.js v6`. Конструктор мгновенно завершает работу до разрешения промиса `getSigner()`, оставляя поле `this.contract` равным `undefined`.

Кроме того, во фронтенде обнаружен ряд других критических ошибок (неблокирующий `forEach` с `async`, необъявленные переменные, искажение ввода чисел, некорректная работа с React props и `localStorage`), которые делают приложение неработоспособным даже после устранения первой ошибки.

---

## 2. Детальная диагностика ошибок

### 2.1. Ошибка из `log.txt`: Асинхронный конструктор в `Contract.jsx`
* **Файл:** `front/src/service/Contract.jsx` (строки 18–27, 69–75)
* **Стектрейс из лога:**
  ```text
  using browser provider
  Contract.jsx:16 provider: BrowserProvider {...}
  Contract.jsx:21 signer: undefined
  Contract.jsx:26 contract: undefined
  Contract.jsx:70 Uncaught (in promise) TypeError: Cannot read properties of undefined (reading 'getUserVault')
  ```
* **Причина:**
  В ethers v6 метод `provider.getSigner()` возвращает `Promise<JsonRpcSigner>`. Конструктор класса в JavaScript **всегда синхронен**. Вызовы `.then(...)` и самовызывающаяся функция `(async () => { ... })()` уходят в очередь микротасок, а конструктор мгновенно возвращает экземпляр `MyContract`, у которого:
  - `this.signer === undefined`
  - `this.contract === undefined`
  Когда в `User.jsx` сразу вызывается метод `.getUserVault()`:
  ```javascript
  async getUserVault() {
      return await this.contract.getUserVault(); // this.contract ещё undefined!
  }
  ```
  Интерпретатор пытается прочитать свойство `getUserVault` у `undefined`, что вызывает фатальное исключение `TypeError`.

---

### 2.2. Неблокирующий `Array.prototype.forEach` с `async/await`
* **Файлы:**
  - `front/src/ui/pages/User.jsx` (строки 17–24)
  - `front/src/ui/pages/Dashboard.jsx` (строки 14–22)
* **Проблемный код:**
  ```javascript
  const vaultsData = []
  Vaults.forEach(async (v) => {
      vaultsData.push(await new MyContract(v.abi, v.address).getUserVault());
  })
  setVaults(vaultsData); // Вызывается ДО завершения асинхронных операций!
  ```
* **Причина:**
  Метод `forEach` игнорирует промисы, возвращаемые асинхронным коллбэком. Он запускает вызовы в фоне и сразу выполняет `setVaults(vaultsData)`. В этот момент массив `vaultsData` ещё пустой (`[]`), из-за чего данные на странице никогда не обновляются.

---

### 2.3. Хардкод строк вместо переменных в JSX
* **Файл:** `front/src/ui/pages/User.jsx` (строки 35, 42–45)
* **Проблемный код:**
  ```jsx
  <p>depositShare: vault[0]</p>
  ...
  <p>userBorrowIndexAtEntry: market[0]</p>
  <p>collateralShare: market[1]</p>
  <p>borrowShare: market[2]</p>
  <p>LTV: market[3]</p>
  ```
* **Причина:**
  Выражения не обёрнуты в фигурные скобки `{}`. Пользователь видит на экране буквально текст `"depositShare: vault[0]"` вместо реальных значений. Кроме того, числа из смарт-контрактов в ethers v6 возвращаются как тип `BigInt`, который необходимо приводить к строке (через `.toString()`).

---

### 2.4. `ReferenceError: vault is not defined` в `Market.jsx`
* **Файл:** `front/src/ui/pages/Market.jsx` (строка 50)
* **Проблемный код:**
  ```jsx
  {actions.map((action) => (
      <Button key={action} onClick={() => handle(vault, action)}>
          {action}
      </Button>
  ))}
  ```
* **Причина:**
  В компоненте `Market.jsx` итерируемый элемент называется `market`, а переменная `vault` не существует. При клике на любую кнопку на странице Market возникает критическая ошибка:
  `ReferenceError: vault is not defined`.

---

### 2.5. Срез значений в полях ввода (`value[0]`)
* **Файлы:**
  - `front/src/ui/pages/Market.jsx` (строка 45)
  - `front/src/ui/pages/Vault.jsx` (строка 45)
  - `front/src/ui/components/DistributeToMarkets.jsx` (строки 21, 27, 33)
* **Проблемный код:**
  ```jsx
  onChange={e => setAmount(e.target.value[0])}
  ```
* **Причина:**
  Обращение по индексу `[0]` берёт только первый символ введённой строки. Если пользователь вводит `100` или адрес `0x123...`, сохраняется только символ `'1'` или `'0'`. Ввести полноценное число или адрес невозможно. Должно быть `e.target.value`.

---

### 2.6. Ошибка сигнатуры React-компонентов (потеря `props`)
* **Файлы:**
  - `front/src/ui/components/DistributeToMarkets.jsx` (строка 4)
  - `front/src/ui/components/RepayFull.jsx` (строка 3)
  - `front/src/ui/components/WithdrawFull.jsx` (строка 3)
* **Проблемный код:**
  ```jsx
  export const RepayFull = (contract) => {
      const handle = async () => {
          await contract.repayFull();
      }
  ...
  ```
* **Причина:**
  Первым аргументом функционального React-компонента является весь объект `props` (т.е. `{ contract: ... }`). Переменная `contract` ссылается на этот объект, и при вызове `contract.repayFull()` возникает ошибка: `contract.repayFull is not a function`. Требуется деструктуризация аргумента: `({ contract })`.

---

### 2.7. Повреждение адреса кошелька в `Context.jsx`
* **Файл:** `front/src/core/Context.jsx` (строки 7, 13)
* **Проблемный код:**
  ```javascript
  const [wallet, setWallet] = useState(localStorage.getItem("wallet") || "")
  ...
  localStorage.setItem("wallet", JSON.stringify(account))
  ```
* **Причина:**
  `JSON.stringify(account)` оборачивает строковый адрес в дополнительные кавычки (`"\"0x123...\""`). При повторном открытии страницы `localStorage.getItem` считывает строку с лишними кавычками, что ломает валидацию адреса. Кроме того, отсутствует проверка наличия `window.ethereum` при логине (вызовет краш, если MetaMask не установлен).

---

## 3. Готовое пошаговое решение

### 3.1. Исправление сервисного слоя: `front/src/service/Contract.jsx`
Создаём механизм гарантированной инициализации: методы контракта ожидают готовности экземпляра `ethers.Contract` перед вызовом.

```javascript
import { Contract, ethers } from "ethers";

export default class MyContract {
    provider;
    signer;
    contract;
    initPromise;

    constructor(abi, address) {
        this.abi = abi;
        this.address = address;
        this.initPromise = this._init();
    }

    async _init() {
        if (typeof window === "undefined" || !window.ethereum) {
            this.provider = ethers.getDefaultProvider();
            this.contract = new Contract(this.address, this.abi, this.provider);
            return this.contract;
        }

        this.provider = new ethers.BrowserProvider(window.ethereum);
        try {
            this.signer = await this.provider.getSigner();
            this.contract = new Contract(this.address, this.abi, this.signer);
        } catch (e) {
            // Если кошелек еще не подключен, подключаем с provider (read-only)
            this.contract = new Contract(this.address, this.abi, this.provider);
        }
        return this.contract;
    }

    async getReadyContract() {
        if (!this.contract) {
            await this.initPromise;
        }
        return this.contract;
    }

    async supply(amount) {
        const c = await this.getReadyContract();
        return await c.supply(amount);
    }

    async borrow(amount) {
        const c = await this.getReadyContract();
        return await c.borrow(amount);
    }

    async repayPart(amount) {
        const c = await this.getReadyContract();
        return await c.repayPart(amount);
    }

    async repayFull() {
        const c = await this.getReadyContract();
        return await c.repayFull();
    }

    async withdrawPart(amount) {
        const c = await this.getReadyContract();
        return await c.withdrawPart(amount);
    }

    async withdrawFull() {
        const c = await this.getReadyContract();
        return await c.withdrawFull();
    }

    async distributeToMarkets(address1, address2, address3) {
        const c = await this.getReadyContract();
        return await c.destributeToMarkets(address1, address2, address3);
    }

    async deposit(amount) {
        const c = await this.getReadyContract();
        return await c.deposit(amount);
    }

    async getVault() {
        const c = await this.getReadyContract();
        return await c.getVault();
    }

    async getMarket() {
        const c = await this.getReadyContract();
        return await c.getMarket();
    }

    async getUserVault() {
        const c = await this.getReadyContract();
        return await c.getUserVault();
    }

    async getUserMarket() {
        const c = await this.getReadyContract();
        return await c.getUserMarket();
    }
}
```

---

### 3.2. Исправление страницы пользователя: `front/src/ui/pages/User.jsx`
Используем `Promise.all` для параллельной загрузки данных и выводим фактические значения.

```jsx
import { MyContext } from "../../core/Context.jsx";
import { useContext, useEffect, useState } from "react";
import { Header } from "../components/Header.jsx";
import { Button, Card, Container, Row, Col, Spinner } from "react-bootstrap";
import { Markets, Vaults } from "../../service/contracts.js";
import MyContract from "../../service/Contract.jsx";

export const User = () => {
    const { wallet, login } = useContext(MyContext);

    const [vaults, setVaults] = useState([]);
    const [markets, setMarkets] = useState([]);
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        if (!wallet) return;

        let isMounted = true;
        setLoading(true);

        const loadData = async () => {
            try {
                const vaultsData = await Promise.all(
                    Vaults.map(async (v) => {
                        const contract = new MyContract(v.abi, v.address);
                        const data = await contract.getUserVault();
                        return { title: v.title, data };
                    })
                );

                const marketsData = await Promise.all(
                    Markets.map(async (m) => {
                        const contract = new MyContract(m.abi, m.address);
                        const data = await contract.getUserMarket();
                        return { title: m.title, data };
                    })
                );

                if (isMounted) {
                    setVaults(vaultsData);
                    setMarkets(marketsData);
                }
            } catch (err) {
                console.error("Ошибка загрузки данных пользователя:", err);
            } finally {
                if (isMounted) setLoading(false);
            }
        };

        loadData();

        return () => {
            isMounted = false;
        };
    }, [wallet]);

    return (
        <>
            <Header />
            <Container className="mt-4">
                {wallet ? (
                    loading ? (
                        <div className="text-center my-5">
                            <Spinner animation="border" />
                            <p className="mt-2">Загрузка данных контрактов...</p>
                        </div>
                    ) : (
                        <Row>
                            <Col md={6}>
                                <h4>Ваши хранилища (Vaults)</h4>
                                {vaults.map((vault, i) => (
                                    <Card key={i} className="mb-3">
                                        <Card.Header><strong>{vault.title}</strong></Card.Header>
                                        <Card.Body>
                                            <p><strong>depositShare:</strong> {vault.data?.toString() ?? "0"}</p>
                                        </Card.Body>
                                    </Card>
                                ))}
                            </Col>

                            <Col md={6}>
                                <h4>Ваши рынки (Markets)</h4>
                                {markets.map((market, i) => (
                                    <Card key={i} className="mb-3">
                                        <Card.Header><strong>{market.title}</strong></Card.Header>
                                        <Card.Body>
                                            <p><strong>userBorrowIndexAtEntry:</strong> {market.data?.[0]?.toString() ?? "0"}</p>
                                            <p><strong>collateralShare:</strong> {market.data?.[1]?.toString() ?? "0"}</p>
                                            <p><strong>borrowShare:</strong> {market.data?.[2]?.toString() ?? "0"}</p>
                                            <p><strong>LTV:</strong> {market.data?.[3]?.toString() ?? "0"}%</p>
                                        </Card.Body>
                                    </Card>
                                ))}
                            </Col>
                        </Row>
                    )
                ) : (
                    <div className="text-center mt-5">
                        <p className="lead">Подключите кошелёк для просмотра балансов и позиций</p>
                        <Button variant="primary" size="lg" onClick={login}>Войти через MetaMask</Button>
                    </div>
                )}
            </Container>
        </>
    );
};
```

---

### 3.3. Исправление панели управления: `front/src/ui/pages/Dashboard.jsx`

```jsx
import { Header } from "../components/Header.jsx";
import { useEffect, useState } from "react";
import { Markets, Vaults } from "../../service/contracts.js";
import MyContract from "../../service/Contract.jsx";
import { Card, Container, Row, Col, Spinner } from "react-bootstrap";

export const Dashboard = () => {
    const [vaults, setVaults] = useState([]);
    const [markets, setMarkets] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        let isMounted = true;

        const loadData = async () => {
            try {
                const vaultsData = await Promise.all(
                    Vaults.map(async (v) => {
                        const contract = new MyContract(v.abi, v.address);
                        const data = await contract.getVault();
                        return { title: v.title, data };
                    })
                );

                const marketsData = await Promise.all(
                    Markets.map(async (m) => {
                        const contract = new MyContract(m.abi, m.address);
                        const data = await contract.getMarket();
                        return { title: m.title, data };
                    })
                );

                if (isMounted) {
                    setVaults(vaultsData);
                    setMarkets(marketsData);
                }
            } catch (e) {
                console.error("Ошибка загрузки Dashboard:", e);
            } finally {
                if (isMounted) setLoading(false);
            }
        };

        loadData();

        return () => {
            isMounted = false;
        };
    }, []);

    return (
        <>
            <Header />
            <Container className="mt-4">
                {loading ? (
                    <div className="text-center my-5">
                        <Spinner animation="border" />
                        <p className="mt-2">Загрузка данных протокола...</p>
                    </div>
                ) : (
                    <>
                        <h3>Хранилища (Vaults)</h3>
                        <Row className="mb-4">
                            {vaults.map((vault, i) => (
                                <Col md={6} key={i}>
                                    <Card className="mb-3">
                                        <Card.Header><strong>{vault.title}</strong> ({vault.data?.[2]})</Card.Header>
                                        <Card.Body>
                                            <p><strong>Asset Token:</strong> {vault.data?.[0]?.toString()}</p>
                                            <p><strong>APY:</strong> {vault.data?.[1]?.toString()}%</p>
                                            <p><strong>Total Assets:</strong> {vault.data?.[3]?.toString()}</p>
                                            <p><strong>Total Supply:</strong> {vault.data?.[4]?.toString()}</p>
                                        </Card.Body>
                                    </Card>
                                </Col>
                            ))}
                        </Row>

                        <h3>Рынки (Markets)</h3>
                        <Row>
                            {markets.map((market, i) => (
                                <Col md={6} key={i}>
                                    <Card className="mb-3">
                                        <Card.Header><strong>{market.title}</strong> ({market.data?.[0]})</Card.Header>
                                        <Card.Body>
                                            <p><strong>USDT / USDC:</strong> {market.data?.[1]?.toString()}</p>
                                            <p><strong>USD1 / USDC:</strong> {market.data?.[2]?.toString()}</p>
                                            <p><strong>USDC / USD:</strong> {market.data?.[3]?.toString()}</p>
                                            <p><strong>DAI / USDC:</strong> {market.data?.[4]?.toString()}</p>
                                            <p><strong>LLTV:</strong> {market.data?.[5]?.toString()}%</p>
                                            <p><strong>Blocks Per Year:</strong> {market.data?.[6]?.toString()}</p>
                                            <p><strong>Last Accrue Block:</strong> {market.data?.[7]?.toString()}</p>
                                            <p><strong>Current Borrow Index:</strong> {market.data?.[8]?.toString()}</p>
                                            <p><strong>Interest Rate:</strong> {market.data?.[9]?.toString()}</p>
                                            <p><strong>Vault:</strong> {market.data?.[10]?.toString()}</p>
                                            <p><strong>Admin:</strong> {market.data?.[11]?.toString()}</p>
                                            <p><strong>Collateral Token:</strong> {market.data?.[12]?.toString()}</p>
                                            <p><strong>Borrow Token:</strong> {market.data?.[13]?.toString()}</p>
                                            <p><strong>Collateral Share:</strong> {market.data?.[14]?.toString()}</p>
                                            <p><strong>Borrow Share:</strong> {market.data?.[15]?.toString()}</p>
                                            <p><strong>Protocol Revenue:</strong> 30% Fee</p>
                                        </Card.Body>
                                    </Card>
                                </Col>
                            ))}
                        </Row>
                    </>
                )}
            </Container>
        </>
    );
};
```

---

### 3.4. Исправление страниц операций: `Market.jsx` и `Vault.jsx`

#### В `front/src/ui/pages/Market.jsx`:
1. Исправлен вызов `handle(market.contract, action)` вместо `handle(vault, action)`.
2. Поля ввода `amount` изолированы для каждого рынка (индивидуальный стейт), чтобы ввод в одну карточку не менял значения в соседних.
3. Исправлен `onChange`: сохраняется `e.target.value`.

```jsx
import { Header } from "../components/Header.jsx";
import { useContext, useState } from "react";
import { MyContext } from "../../core/Context.jsx";
import { Markets } from "../../service/contracts.js";
import MyContract from "../../service/Contract.jsx";
import { Button, ButtonGroup, Card, Container, FormControl, FormGroup, Row, Col } from "react-bootstrap";
import { WithdrawFull } from "../components/WithdrawFull.jsx";
import { RepayFull } from "../components/RepayFull.jsx";

const MarketCard = ({ marketInfo }) => {
    const actions = ["supply", "borrow", "repayPart", "withdrawPart"];
    const [amount, setAmount] = useState("");
    const contract = new MyContract(marketInfo.abi, marketInfo.address);

    const handle = async (action) => {
        if (!amount) return;
        try {
            await contract[action](amount);
            alert(`Успешно выполнено: ${action}`);
        } catch (err) {
            console.error(`Ошибка при ${action}:`, err);
            alert(`Ошибка: ${err.message}`);
        }
    };

    return (
        <Card className="mb-3">
            <Card.Header><strong>{marketInfo.title}</strong></Card.Header>
            <Card.Body>
                <FormGroup className="mb-3">
                    <FormControl
                        type="number"
                        min={0}
                        placeholder="Введите сумму (например, 100)"
                        value={amount}
                        onChange={e => setAmount(e.target.value)}
                    />
                </FormGroup>
                <ButtonGroup className="d-flex flex-wrap gap-2 mb-3">
                    {actions.map((action) => (
                        <Button key={action} variant="outline-primary" onClick={() => handle(action)}>
                            {action}
                        </Button>
                    ))}
                </ButtonGroup>
                <div className="d-flex gap-2">
                    <WithdrawFull contract={contract} />
                    <RepayFull contract={contract} />
                </div>
            </Card.Body>
        </Card>
    );
};

export const Market = () => {
    const { wallet } = useContext(MyContext);

    return (
        <>
            <Header />
            <Container className="mt-4">
                {wallet ? (
                    <Row>
                        {Markets.map((m, i) => (
                            <Col md={6} key={i}>
                                <MarketCard marketInfo={m} />
                            </Col>
                        ))}
                    </Row>
                ) : (
                    <p className="text-center mt-5 text-muted">Пожалуйста, подключите кошелёк в шапке сайта</p>
                )}
            </Container>
        </>
    );
};
```

---

### 3.5. Исправление дочерних компонентов

#### `front/src/ui/components/RepayFull.jsx`:
```jsx
import { Button, ButtonGroup } from "react-bootstrap";

export const RepayFull = ({ contract }) => {
    const handle = async () => {
        try {
            await contract.repayFull();
            alert("repayFull выполнен успешно");
        } catch (e) {
            console.error(e);
            alert("Ошибка repayFull: " + e.message);
        }
    };

    return (
        <ButtonGroup>
            <Button variant="danger" onClick={handle}>
                repayFull
            </Button>
        </ButtonGroup>
    );
};
```

#### `front/src/ui/components/WithdrawFull.jsx`:
```jsx
import { Button, ButtonGroup } from "react-bootstrap";

export const WithdrawFull = ({ contract }) => {
    const handle = async () => {
        try {
            await contract.withdrawFull();
            alert("withdrawFull выполнен успешно");
        } catch (e) {
            console.error(e);
            alert("Ошибка withdrawFull: " + e.message);
        }
    };

    return (
        <ButtonGroup>
            <Button variant="warning" onClick={handle}>
                withdrawFull
            </Button>
        </ButtonGroup>
    );
};
```

#### `front/src/ui/components/DistributeToMarkets.jsx`:
```jsx
import { useState } from "react";
import { Button, ButtonGroup, FormControl, FormGroup } from "react-bootstrap";

export const DistributeToMarkets = ({ contract }) => {
    const [address1, setAddress1] = useState("");
    const [address2, setAddress2] = useState("");
    const [address3, setAddress3] = useState("");

    const handle = async () => {
        try {
            await contract.distributeToMarkets(address1, address2, address3);
            alert("distributeToMarkets выполнен успешно");
        } catch (e) {
            console.error(e);
            alert("Ошибка distributeToMarkets: " + e.message);
        }
    };

    return (
        <div className="mt-3 border p-2 rounded">
            <h6>Распределить по рынкам:</h6>
            <FormGroup className="d-flex flex-column gap-2 mb-2">
                <FormControl
                    type="text"
                    placeholder="Адрес рынка 1 (0x...)"
                    value={address1}
                    onChange={e => setAddress1(e.target.value)}
                />
                <FormControl
                    type="text"
                    placeholder="Адрес рынка 2 (0x...)"
                    value={address2}
                    onChange={e => setAddress2(e.target.value)}
                />
                <FormControl
                    type="text"
                    placeholder="Адрес рынка 3 (0x...)"
                    value={address3}
                    onChange={e => setAddress3(e.target.value)}
                />
            </FormGroup>
            <ButtonGroup>
                <Button variant="secondary" onClick={handle}>
                    distributeToMarkets
                </Button>
            </ButtonGroup>
        </div>
    );
};
```

---

### 3.6. Исправление авторизации: `front/src/core/Context.jsx`

```javascript
import { createContext, useState, useEffect } from "react";

const MyContext = createContext({});

const ContextProvider = ({ children }) => {
    const [wallet, setWallet] = useState(localStorage.getItem("wallet") || "");

    useEffect(() => {
        if (window.ethereum) {
            window.ethereum.on("accountsChanged", (accounts) => {
                if (accounts.length > 0) {
                    setWallet(accounts[0]);
                    localStorage.setItem("wallet", accounts[0]);
                } else {
                    setWallet("");
                    localStorage.removeItem("wallet");
                }
            });
        }
    }, []);

    const login = async () => {
        if (!window.ethereum) {
            alert("MetaMask не обнаружен. Установите расширение MetaMask!");
            return;
        }
        try {
            const accounts = await window.ethereum.request({ method: "eth_requestAccounts" });
            const account = accounts[0];
            setWallet(account);
            localStorage.setItem("wallet", account);
        } catch (err) {
            console.error("Ошибка при авторизации:", err);
        }
    };

    const logout = async () => {
        setWallet("");
        localStorage.removeItem("wallet");
    };

    const values = {
        login,
        logout,
        wallet
    };

    return <MyContext.Provider value={values}>{children}</MyContext.Provider>;
};

export { MyContext, ContextProvider };
```

---

## 4. Сводная таблица найденных багов

| № | Файл | Локация | Описание ошибки | Последствие |
|---|------|---------|-----------------|-------------|
| 1 | `Contract.jsx` | Конструктор | Асинхронные вызовы `getSigner()` в синхронном конструкторе | `contract: undefined`, падение при любом вызове метода |
| 2 | `User.jsx`, `Dashboard.jsx` | `useEffect` | `forEach(async ...)` вместо `Promise.all` | Данные контрактов не попадают в state (`[]`) |
| 3 | `User.jsx` | JSX Card | Текстовые строки `'vault[0]'` вместо JSX-выражений | Пользователь видит название переменной вместо значения |
| 4 | `Market.jsx` | Кнопки действий | Вызов `handle(vault, action)` вместо `market` | `ReferenceError: vault is not defined` при клике |
| 5 | `Market.jsx`, `Vault.jsx`, `DistributeToMarkets.jsx` | `onChange` инпутов | `value[0]` берёт только 1 символ | Нельзя ввести число/адрес длиннее 1 знака |
| 6 | `RepayFull.jsx`, `WithdrawFull.jsx`, `DistributeToMarkets.jsx` | Параметры функции | `(contract)` вместо `({ contract })` | `contract.method is not a function` |
| 7 | `Context.jsx` | `localStorage` | `JSON.stringify` добавляет экранированные кавычки | Повреждение адреса кошелька в хранилище |
| 8 | `Market.jsx`, `Vault.jsx` | `useState` | Одно состояние `amount` на весь список | Ввод суммы в одной карточке меняет её во всех остальных |
