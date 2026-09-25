import marketABI from './marketABI.json';
import vaultABI from './vaultABI.json';

export const Markets = [
    { address:"0x5C2A0043DCB069170132cC9d8930Bb92C55dC309", abi:marketABI, title:"Market1" },
    { address:"0x181Af4FbC6A1281f5A165c0631917a4D2a3d84d1", abi:marketABI, title:"Market2" },
    { address:"0x1B2034f423f9e083cB26E65b513620D424e4f573", abi:marketABI, title:"Market3" },
]

export const Vaults = [
    { address:"0xb94496593d73C7629364c211093a91168E5d0CC8", abi:vaultABI, title:"Vault1"},
    { address:"0x9aa7356C5529CdDC6e39D481568Da36AeEa9f445", abi:vaultABI, title:"Vault2"},
]