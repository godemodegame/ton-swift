import Foundation

func contractAddress(workchain: Int8, stateInit: StateInit) throws -> Address {
    let hash = try Builder()
        .store(stateInit)
        .endCell()
        .hash()
    
    return Address(workChain: workchain, hash: hash)
}