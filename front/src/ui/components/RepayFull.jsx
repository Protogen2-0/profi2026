import {Button} from "react-bootstrap";

export const RepayFull = ({contract}) => {
    const handle = async () => {
        await contract.repayFull();
    }

    return (
        <>
            <h2>полное погашение</h2>
            <Button className={"containerButton"} onClick={() => handle()}>
                repayFull
            </Button>
        </>
    )
}