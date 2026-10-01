import { network } from "hardhat";

// Подключаемся к сети localhost (Geth)
const { ethers } = await network.getOrCreate("localhost");

// Адрес задеплоенного контракта Storage
const CONTRACT_ADDRESS = "0x82567a6F6E3AbE246F62350322a07Af7F413cFe6";

// Получаем типизированный инстанс контракта
const storage = await ethers.getContractAt("Storage", CONTRACT_ADDRESS);

console.log("=== Взаимодействие с контрактом Storage ===");

// 1. ЧТЕНИЕ: вызов view-метода
const currentValue = await storage.retrieve();
console.log(`Текущее значение number: ${currentValue.toString()}`);

// 2. ЗАПИСЬ: отправка транзакции
const newValue = 777n;
console.log(`\nОтправляем транзакцию store(${newValue})...`);
const tx = await storage.store(newValue);
console.log(`Хеш транзакции: ${tx.hash}`);

// Ожидание подтверждения транзакции в блоке
const receipt = await tx.wait();
console.log(`Транзакция подтверждена в блоке #${receipt?.blockNumber}`);

// 3. ПРОВЕРКА: считываем обновленное значение
const updatedValue = await storage.retrieve();
console.log(`\nНовое значение number: ${updatedValue.toString()}`);