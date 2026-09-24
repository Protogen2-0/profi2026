import marketABI from './marketABI.json';
import vaultABI from './vaultABI.json';

export const Markets = [
    { address:"0x3F4D805425D6A651b35349DA6858E5Ec644e8039", abi:marketABI, title:"Market1" },
    { address:"0x3bF6aE8A244d51D351046409A7041a2DEc2565f6", abi:marketABI, title:"Market2" },
    { address:"0x94B48F9818a3fE0ce154C67462846c4704b9Edc8", abi:marketABI, title:"Market3" },
]

export const Vaults = [
    { address:"0x6De5540D1BAd212C7CbeA9Aff8eeeB43174476d7", abi:vaultABI, title:"Vault1"},
    { address:"0x181Af4FbC6A1281f5A165c0631917a4D2a3d84d1", abi:vaultABI, title:"Vault2"},
]