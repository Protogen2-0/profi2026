import {Contract, ethers} from "ethers";

export default class MyContract  {
    provider;
    signer;

    constructor(abi, address) {
        if (window.ethereum == null) {
            this.provider = ethers.getDefaultProvider()
            console.log("using default provider")
        }
        else {
            this.provider = new ethers.BrowserProvider(window.ethereum)
            console.log("using browser provider")
        }
        console.log("provider:", this.provider);

        this.provider.getSigner().then((signer) => {
            this.signer = signer;
        });
        console.log("signer:", this.signer);

        (async()=>{
            this.contract = await new Contract(address, abi, this.signer);
        })()
        console.log("contract:", this.contract);
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

    async distributeToMarkets(address1, address2, address3){
        return await this.contract.destributeToMarkets(address1, address2, address3); // distribute
    }

    async deposit(amount){
        return await this.contract.deposit(amount);
    }

    async getVault() {
        return await this.contract.getVault();
    }

    async getMarket(){
        return await this.contract.getMarket();
    }

    async getUserVault(){
        return await this.contract.getUserVault();
    }

    async getUserMarket(){
        return await this.contract.getUserMarket();
    }
}