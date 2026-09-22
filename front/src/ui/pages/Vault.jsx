import {Header} from "../components/Header.jsx";
import {useContext, useEffect, useState} from "react";
import {MyContext} from "../../core/Context.jsx";
import {vaultAddresses} from "../../service/contracts.js";
import Contract from "../../service/Contract.jsx";
import vaultABI from "../../service/vaultABI.json";

export const Vault = () => {
    const {wallet} = useContext(MyContext)

    const [vaults, setVaults] = useState([])

    useEffect(()=>{
        const vaults_ = [];
        setVaults(vaults_);
    },[])

    return (
        <>
            <Header />
            {wallet ?
                vaults.map((vault, i) => {

                })
            : "no wallet provided"}
        </>
    )
}