import marketABI from './marketABI.json';
import vaultABI from './vaultABI.json';

export const Markets = [
    { address:"0x05c679aba50c8c043eccEDA6191a3258A537AdCC", abi:marketABI, title:"Market1" },
    { address:"0x1B2034f423f9e083cB26E65b513620D424e4f573", abi:marketABI, title:"Market2" },
    { address:"0x4c18f4f86eA1c0a0B2A4C22E41fAd7fEC4a64238", abi:marketABI, title:"Market3" },
]

export const Vaults = [
    { address:"0x9aa7356C5529CdDC6e39D481568Da36AeEa9f445", abi:vaultABI, title:"Vault1"},
    { address:"0x7F00801caae8990fB31804025f8cA3317d1FbFF8", abi:vaultABI, title:"Vault2"},
]