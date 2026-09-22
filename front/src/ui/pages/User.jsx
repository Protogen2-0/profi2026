import {MyContext} from "../../core/Context.jsx";
import {useContext} from "react";
import {Header} from "../components/Header.jsx";
import {Button} from "react-bootstrap";

export const User = () =>{
    const {wallet, login} = useContext(MyContext)
    return(
        <>
        <Header/>
            {wallet ?
                <p>already logged in</p>
            :
            <Button onClick={login}> Login </Button>}
        </>
    )
}
