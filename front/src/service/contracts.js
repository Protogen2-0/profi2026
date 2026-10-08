import marketABI from './marketABI.json';
import vaultABI from './vaultABI.json';

export const Markets = [
    { address:"0x2F415f51FD16900fc1F92943B1F9A07F1b7EEa14", abi:marketABI, title:"Market1" },
    { address:"0x82567a6F6E3AbE246F62350322a07Af7F413cFe6", abi:marketABI, title:"Market2" },
    { address:"0xcf950f044E11D2E0318314ecd940ec19abf51130", abi:marketABI, title:"Market3" },
]

export const Vaults = [
    { address:"0xD91Fb8750Ea1decEf4cEE9D8314f4a60DE039457", abi:vaultABI, title:"Vault1"},
    { address:"0x2139B5Baf855EEE55Cdb5F19dF50583585581EaD", abi:vaultABI, title:"Vault2"},
]