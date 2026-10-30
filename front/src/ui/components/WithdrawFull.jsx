import {Button} from "react-bootstrap";

export const WithdrawFull = ({contract}) => {
    const handle = async () => {
        await contract.withdrawFull();
    }

    return (
        <>
            <h2>вывод средств</h2>
            <Button className="containerButton" onClick={() => handle()}>
                withdrawFull
            </Button>
        </>
    )
}