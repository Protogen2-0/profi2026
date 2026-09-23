import marketABI from './marketABI.json';
import vaultABI from './vaultABI.json';

export const Markets = [
    { address:"0x1227148149", abi:marketABI, title:"Market1" },
    { address:"0x7691436124", abi:marketABI, title:"Market2" },
    { address:"0x6912340590", abi:marketABI, title:"Market3" },
]

export const Vaults = [
    { address:"0x1227148149", abi:vaultABI, title:"Vault1"},
    { address:"0x7691436124", abi:vaultABI, title:"Vault2"},
]