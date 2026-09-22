import {ethers} from "ethers";

export default class Contract  {
    provider;
    signer;

    constructor(abi, address) {
        this.provider = new ethers.BrowserProvider(window.ethereum)
        this.signer = (async()=>{
            return await this.provider.getSigner()
        })
        this.contract = new Contract(address, abi, this.signer);
    }

    async supply(amount){
        return await this.contract.supply(amount);
    }

    async borrow(amount){
        return await this.contract.borrow(amount);
    }

    async repayPart(amount){
        return await this.contract.repayPart(amount);
    }

    async repayFull(){
        return await this.contract.repayFull();
    }

    async withdrawPart(amount){
        return await this.contract.withdrawPart(amount);
    }

    async withdrawFull(){
        return await this.contract.withdrawFull();
    }

    async destributeToMarkets(address1, address2, address3){
        return await this.contract.destributeToMarkets();
    }

    async deposit(amount){
        return await this.contract.deposit(amount);
    }
}