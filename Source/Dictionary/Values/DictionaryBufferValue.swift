import Foundation

public struct DictionaryBufferValue: DictionaryValue {
    public let bytes: Int
    
    public init(bytes: Int) {
        self.bytes = bytes
    }
    
    public func serialize(src: any DictionaryKeyTypes, builder: Builder) throws {
        guard let src = src as? Data else {
            throw TonError.custom("Wrong src type. Expected buffer")
        }
        
        guard src.count == bytes else {
            throw TonError.custom("Invalid buffer size")
        }
        
        try builder.bits.write(data: src)
    }
    
    public func parse(src: Slice) throws -> any DictionaryKeyTypes {
        return try src.bits.loadBytes(bytes)
    }
}
