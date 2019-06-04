//
//  CFNumber.swift
//
//  Copyright © 2018 Doug Russell. All rights reserved.
//

import Foundation
import CoreGraphics

public protocol BooleanProviding {
    var boolValue: Bool { get }
}

public extension CFBoolean {
    static var typeID: CFTypeID {
        return CFBooleanGetTypeID()
    }
}

extension CFBoolean : BooleanProviding {
    public var boolValue: Bool {
        return Bool(CFBooleanGetValue(self))
    }
}

public enum CFNumberError : Error {
    case typeMismatch
}

public extension CFNumber {
    static var typeID: CFTypeID {
        return CFNumberGetTypeID()
    }
    var type: CFNumberType {
        return CFNumberGetType(self)
    }
    static func create<NumberType>(value: NumberType, type: CFNumberType? = nil) -> CFNumber? {
        if let type = type {
            var value = value
            return CFNumberCreate(kCFAllocatorDefault, type, &value)
        }
        if NumberType.self == Int8.self {
            var value = value
            return CFNumberCreate(kCFAllocatorDefault, .sInt8Type, &value)
        } else if NumberType.self == Int16.self {
            var value = value
            return CFNumberCreate(kCFAllocatorDefault, .sInt16Type, &value)
        } else if NumberType.self == Int32.self {
            var value = value
            return CFNumberCreate(kCFAllocatorDefault, .sInt32Type, &value)
        } else if NumberType.self == Int64.self {
            var value = value
            return CFNumberCreate(kCFAllocatorDefault, .sInt64Type, &value)
        } else if NumberType.self == Int.self {
            var value = value
            return CFNumberCreate(kCFAllocatorDefault, .nsIntegerType, &value)
        } else if NumberType.self == Float.self {
            var value = value
            return CFNumberCreate(kCFAllocatorDefault, .floatType, &value)
        } else if NumberType.self == Double.self {
            var value = value
            return CFNumberCreate(kCFAllocatorDefault, .doubleType, &value)
        } else if NumberType.self == CGFloat.self {
            var value = value
            return CFNumberCreate(kCFAllocatorDefault, .cgFloatType, &value)
        }
        return nil
    }
    private func check(_ expectedType: CFNumberType) throws {
        guard type == expectedType else {
            throw CFNumberError.typeMismatch
        }
    }
    private func get<T>(_ defaultValue: T) throws -> T {
        var value = defaultValue
        guard CFNumberGetValue(self, type, &value) else {
            throw CFNumberError.typeMismatch
        }
        return value
    }
    func int8Value() throws -> Int8 {
        try check(.sInt8Type)
        return try get(Int8(0))
    }
    func int16Value() throws -> Int16 {
        try check(.sInt16Type)
        return try get(Int16(0))
    }
    func int32Value() throws -> Int32 {
        try check(.sInt32Type)
        return try get(Int32(0))
    }
    func int64Value() throws -> Int64 {
        try check(.sInt64Type)
        return try get(Int64(0))
    }
    func intValue() throws -> Int32 {
        try check(.intType)
        return try get(0)
    }
    func integerValue() throws -> Int {
        try check(.nsIntegerType)
        return try get(0)
    }
    func longValue() throws -> CLong {
        try check(.longType)
        return try get(CLong(0))
    }
    func longLongValue() throws -> CLongLong {
        try check(.longLongType)
        return try get(CLongLong(0))
    }
    func cfIndexValue() throws -> CFIndex {
        try check(.cfIndexType)
        return try get(CFIndex(0))
    }
    func float32Value() throws -> Float32 {
        try check(.float32Type)
        return try get(Float32(0.0))
    }
    func float64Value() throws -> Float64 {
        try check(.float64Type)
        return try get(Float64(0.0))
    }
    func charValue() throws -> CChar {
        try check(.charType)
        return try get(CChar(0))
    }
    func shortValue() throws -> CShort {
        try check(.shortType)
        return try get(CShort(0))
    }
    func floatValue() throws -> Float {
        try check(.floatType)
        return try get(Float(0.0))
    }
    func doubleValue() throws -> Double {
        try check(.doubleType)
        return try get(0.0)
    }
    func cgFloatValue() throws -> CGFloat {
        try check(.cgFloatType)
        return try get(CGFloat(0.0))
    }
}

extension CFNumber : BooleanProviding {
    public var boolValue: Bool {
        switch type {
        case .sInt8Type:
            return (try? self.int8Value())! != 0
        case .sInt16Type:
            return (try? self.int16Value())! != 0
        case .sInt32Type:
            return (try? self.int32Value())! != 0
        case .sInt64Type:
            return (try? self.int64Value())! != 0
        case .float32Type:
            return (try? self.float32Value())! != 0
        case .float64Type:
            return (try? self.float64Value())! != 0
        case .charType:
            return (try? self.charValue())! != 0
        case .shortType:
            return (try? self.shortValue())! != 0
        case .intType:
            return (try? self.intValue())! != 0
        case .longType:
            return (try? self.longValue())! != 0
        case .longLongType:
            return (try? self.longLongValue())! != 0
        case .floatType:
            return (try? self.floatValue())! != 0
        case .doubleType:
            return (try? self.doubleValue())! != 0
        case .cfIndexType:
            return (try? self.cfIndexValue())! != 0
        case .nsIntegerType:
            return (try? self.integerValue())! != 0
        case .cgFloatType:
            return (try? self.cgFloatValue())! != 0
        }
    }
}
