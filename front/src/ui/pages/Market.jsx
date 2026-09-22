import {Header} from "../components/Header.jsx";
import {useContext} from "react";
import {MyContext} from "../../core/Context.jsx";

export const Market = () => {
    const {wallet} = useContext(MyContext)
    return (
        <>
        <Header />
            {wallet ?
                <>

                </>
            : "no wallet provided"}
        </>
    )
}