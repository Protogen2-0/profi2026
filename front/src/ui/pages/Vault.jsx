import {Header} from "../components/Header.jsx";
import {useContext, useEffect, useState} from "react";
import {MyContext} from "../../core/Context.jsx";
import {Vaults} from "../../service/contracts.js";
import MyContract from "../../service/Contract.jsx";
import {Button, ButtonGroup, Card, FormControl, FormGroup} from "react-bootstrap";
import {DistributeToMarkets} from "../components/DistributeToMarkets.jsx";
import {WithdrawFull} from "../components/WithdrawFull.jsx";

export const Vault = () => {
    const {wallet} = useContext(MyContext)

    const actions = ["deposit", "withdrawPart"]

    const [amount, setAmount] = useState("");

    const [vaults, setVaults] = useState([])

    useEffect(()=>{
        const vaults_ = [];
        Vaults.forEach(v => {
            vaults_.push(new MyContract(v.abi, v.address));
        })
        setVaults(vaults_);
    },[])

    const handle = async (vault, action) => {
        await vault[action](amount)
    }

    return (
        <>
            <Header />
            {wallet ?
                vaults.map((vault, i) => (
                    <Card key={i}>
                        <Card.Header>{vault.title}</Card.Header>
                        <Card.Body>
                            <FormGroup>
                                <FormControl
                                    type={"number"}
                                    min={0}
                                    placeholder={"100"}
                                    value={amount}
                                    onChange={e => setAmount(e.target.value[0])}
                                />
                            </FormGroup>
                            <ButtonGroup>
                                {actions.map((action) => (
                                    <Button key={action} onClick={() => handle(vault, action)}>
                                        {action}
                                    </Button>
                                ))}
                            </ButtonGroup>
                            <DistributeToMarkets contract={vault} />
                            <WithdrawFull contract={vault} />
                        </Card.Body>
                    </Card>
                ))
            : "no wallet provided"}
        </>
    )
}