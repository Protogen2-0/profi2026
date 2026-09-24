import {Button, ButtonGroup} from "react-bootstrap";

export const WithdrawFull = ({contract}) => {
    const handle = async () => {
        await contract.withdrawFull();
    }

    return (
        <>
            <hr/>
            <h2>вывод средств</h2>
            <ButtonGroup>
                <Button className="containerButton" onClick={() => handle()}>
                    withdrawFull
                </Button>
            </ButtonGroup>
        </>
    )
}