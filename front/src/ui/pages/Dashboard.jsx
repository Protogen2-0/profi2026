import {Header} from "../components/Header.jsx";
import {useEffect, useState} from "react";
import {Markets, Vaults} from "../../service/contracts.js";
import Contract from "../../service/Contract.jsx";
import {Card} from "react-bootstrap";

export const Dashboard = () => {
    const [vaults, setVaults] = useState([]);
    const [markets, setMarkets] = useState([]);

    useEffect(() => {
        const vaultsData = []
        const marketsData = []
        Vaults.forEach(async (v)=>{
            vaultsData.push(await new Contract(v.abi, v.address).getVault());
        })
        Markets.forEach(async (m)=>{
            marketsData.push(await new Contract(m.abi, m.address).getMarket());
        })
        setVaults(vaultsData);
        setMarkets(marketsData);
    },[])

    return (
        <>
            <Header />

            {vaults?.map((vault)=>(
                <Card title={vault[2]}>
                    <Card.Body>
                        <p>assetToken: {vault[0]}</p>
                        <p>APY:        {vault[1]}</p>
                        <p>assets:     {vault[3]}</p>
                        <p>totalSupply:{vault[4]}</p>
                    </Card.Body>
                </Card>
            ))}

            {markets?.map((market)=>(
                <Card title={market[0]}>
                    <Card.Body>
                        <p>USDT_UCDC_cost:     {market[1]}</p>
                        <p>USD1_USDC_cost:     {market[2]}</p>
                        <p>USDC_USD_cost:      {market[3]}</p>
                        <p>DAI_USDC_cost:      {market[4]}</p>
                        <p>LLTV:               {market[5]}</p>
                        <p>blocksPerYear:      {market[6]}</p>
                        <p>lastAccureBlock:    {market[7]}</p>
                        <p>currentBorrowIndex: {market[8]}</p>
                        <p>InterestRate:       {market[9]}</p>
                        <p>vault:              {market[10]}</p>
                        <p>admin:              {market[12]}</p>
                        <p>collateralToken:    {market[13]}</p>
                        <p>borrowToken:        {market[14]}</p>
                        <p>collateralShare:    {market[15]}</p>
                        <p>borrowShare:        {market[16]}</p>
                        <p>protocol revenue:   30% Fee     </p>
                    </Card.Body>
                </Card>
            ))}

        </>
    )
}