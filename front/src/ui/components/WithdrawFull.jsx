import {Button, ButtonGroup} from "react-bootstrap";

export const WithdrawFull = (contract) => {
    const handle = async () => {
        await contract.withdrawFull();
    }

    return (
        <>
            <ButtonGroup>
                <Button onClick={() => handle()}>
                    withdrawFull
                </Button>
            </ButtonGroup>
        </>
    )
}