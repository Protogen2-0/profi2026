import {Header} from "../components/Header.jsx";
import {useContext, useEffect, useState} from "react";
import {MyContext} from "../../core/Context.jsx";
import {Markets, Vaults} from "../../service/contracts.js";
import Contract from "../../service/Contract.jsx";
import {Button, ButtonGroup, Card, FormControl, FormGroup} from "react-bootstrap";
import {DistributeToMarkets} from "../components/DistributeToMarkets.jsx";
import {WithdrawFull} from "../components/WithdrawFull.jsx";
import {RepayFull} from "../components/RepayFull.jsx";

export const Market = () => {
    const {wallet} = useContext(MyContext)

    const actions = ["supply", "borrow", "repayPart", "withdrawPart"]

    const [amount, setAmount] = useState("");

    const [markets, setMarkets] = useState([])

    useEffect(()=>{
        const markets_ = [];
        Markets.forEach(m => {
            markets_.push(new Contract(m.abi, m.address));
        })
        setMarkets(markets_);
    },[])

    const handle = async (market, action) => {
        await market[action](amount)
    }

    return (
        <>
            <Header />
            {wallet ?
                markets.map((market, i) => (
                    <Card key={i}>
                        <Card.Header>{market.title}</Card.Header>
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
                            <WithdrawFull contract={market} />
                            <RepayFull contract={market} />
                        </Card.Body>
                    </Card>
                ))
                : "no wallet provided"}
        </>
    )
}