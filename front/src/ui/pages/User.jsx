import {MyContext} from "../../core/Context.jsx";
import {useContext, useEffect, useState} from "react";
import {Header} from "../components/Header.jsx";
import {Button, Card} from "react-bootstrap";
import {Markets, Vaults} from "../../service/contracts.js";
import MyContract from "../../service/Contract.jsx";

export const User = () =>{
    const {wallet, login} = useContext(MyContext)

    const [vaults, setVaults] = useState([]);
    const [markets, setMarkets] = useState([]);

    useEffect(() => {
        if(wallet){
            const vaultsData = []
            const marketsData = []
            Vaults.forEach(async (v)=>{
                vaultsData.push(await new MyContract(v.abi, v.address).getUserVault());
            })
            Markets.forEach(async (m)=>{
                marketsData.push(await new MyContract(m.abi, m.address).getUserMarket());
            })
            setVaults(vaultsData);
            setMarkets(marketsData);
        }
    },[wallet])

    return(
        <>
        <Header/>
            {wallet ?
                <>
                {vaults.map((vault, i)=>(
                    <Card title={`vault ${i}`}>
                        <Card.Body>
                            <p>depositShare: {vault[0]}</p>
                        </Card.Body>
                    </Card>
                ))}
                {markets.map((market, i)=>(
                    <Card title={`market ${i}`}>
                        <Card.Body>
                            <p>userBorrowIndexAtEntry: {market[0]}</p>
                            <p>collateralShare: {market[1]}</p>
                            <p>borrowShare: {market[2]}</p>
                            <p>LTV: {market[3]}</p>
                        </Card.Body>
                    </Card>
                ))}
                </>
            :
                <Button onClick={login}> Login </Button>
            }
        </>
    )
}
