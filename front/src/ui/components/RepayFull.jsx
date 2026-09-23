import {Button, ButtonGroup} from "react-bootstrap";

export const RepayFull = (contract) => {
    const handle = async () => {
        await contract.repayFull();
    }

    return (
        <>
            <ButtonGroup>
                <Button onClick={() => handle()}>
                    repayFull
                </Button>
            </ButtonGroup>
        </>
    )
}