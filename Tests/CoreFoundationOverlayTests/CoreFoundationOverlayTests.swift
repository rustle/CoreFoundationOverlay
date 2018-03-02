//
//  CoreFoundationOverlayTests.swift
//
//  Copyright © 2018 Doug Russell. All rights reserved.
//

import XCTest
@testable import CoreFoundationOverlay

class CoreFoundationOverlayTests : XCTestCase {
    func testArrayApply() {
        let expectedStrings = ["1", "2", "3"]
        var strings = [String]()
        (expectedStrings as CFArray).apply { value in
            strings.append(value as! String)
        }
        XCTAssertEqual(expectedStrings, strings)
    }
    func testSetApply() {
        let expectedValues = Set(["1", "2", "3"])
        var values = Set<String>()
        (expectedValues as CFSet).apply { value in
            values.insert(value as! String)
        }
        XCTAssertEqual(values, expectedValues)
    }
    func testDictionaryApply() {
        let expectedValues = ["1" : "2", "3" : "4"]
        var values = [String:String]()
        (expectedValues as CFDictionary).apply { key, value in
            values[key as! String] = (value as! String)
        }
        XCTAssertEqual(expectedValues, values)
    }
    func testTypeID() {
        XCTAssertEqual(CFString.typeID, CFStringGetTypeID())
        XCTAssertEqual(CFArray.typeID, CFArrayGetTypeID())
        XCTAssertEqual(CFSet.typeID, CFSetGetTypeID())
        XCTAssertEqual(CFDictionary.typeID, CFDictionaryGetTypeID())
        XCTAssertEqual(CFNumber.typeID, CFNumberGetTypeID())
        XCTAssertEqual(CFRunLoop.typeID, CFRunLoopGetTypeID())
    }
    func testNumberInt8() {
        let expectedValue = Int8(1)
        guard let number = CFNumber.create(value: expectedValue) else {
            XCTFail()
            return
        }
        do {
            let value = try number.int8Value()
            XCTAssertEqual(expectedValue, value)
        } catch {
            
        }
    }
    func testNumberInt16() {
        let expectedValue = Int16(30567)
        guard let number = CFNumber.create(value: expectedValue) else {
            XCTFail()
            return
        }
        do {
            let value = try number.int16Value()
            XCTAssertEqual(expectedValue, value)
        } catch {
            
        }
    }
    func testNumberInt32() {
        let expectedValue = Int32(345678901)
        guard let number = CFNumber.create(value: expectedValue) else {
            XCTFail()
            return
        }
        do {
            let value = try number.int32Value()
            XCTAssertEqual(expectedValue, value)
        } catch {
            
        }
    }
    func testNumberInt64() {
        let expectedValue = Int64(12345678901)
        guard let number = CFNumber.create(value: expectedValue) else {
            XCTFail()
            return
        }
        do {
            let value = try number.int64Value()
            XCTAssertEqual(expectedValue, value)
        } catch {
            
        }
    }
    func testNumberInt() {
        let expectedValue = Int32(123456789)
        guard let number = CFNumber.create(value: expectedValue) else {
            XCTFail()
            return
        }
        do {
            let value = try number.intValue()
            XCTAssertEqual(expectedValue, value)
        } catch {
            
        }
    }
    func testNumberInteger() {
        let expectedValue = 12345678901
        guard let number = CFNumber.create(value: expectedValue) else {
            XCTFail()
            return
        }
        do {
            let value = try number.integerValue()
            XCTAssertEqual(expectedValue, value)
        } catch {
            
        }
    }
    func testNumberLong() {
        let expectedValue = CLong(1)
        guard let number = CFNumber.create(value: expectedValue, type: .longType) else {
            XCTFail()
            return
        }
        do {
            let value = try number.longValue()
            XCTAssertEqual(expectedValue, value)
        } catch {
            
        }
    }
    func testNumberLongLong() {
        let expectedValue = CLongLong(1)
        guard let number = CFNumber.create(value: expectedValue, type: .longLongType) else {
            XCTFail()
            return
        }
        do {
            let value = try number.longLongValue()
            XCTAssertEqual(expectedValue, value)
        } catch {
            
        }
    }
    func testNumberCFIndex() {
        let expectedValue = CFIndex(1)
        guard let number = CFNumber.create(value: expectedValue, type: .cfIndexType) else {
            XCTFail()
            return
        }
        do {
            let value = try number.cfIndexValue()
            XCTAssertEqual(expectedValue, value)
        } catch {
            
        }
    }
    func testNumberFloat32() {
        let expectedValue = Float32(1)
        guard let number = CFNumber.create(value: expectedValue, type: .float32Type) else {
            XCTFail()
            return
        }
        do {
            let value = try number.float32Value()
            XCTAssertEqual(expectedValue, value)
        } catch {
            
        }
    }
    func testNumberFloat64() {
        let expectedValue = Float64(1)
        guard let number = CFNumber.create(value: expectedValue, type: .float64Type) else {
            XCTFail()
            return
        }
        do {
            let value = try number.float64Value()
            XCTAssertEqual(expectedValue, value)
        } catch {
            
        }
    }
    func testNumberCChar() {
        let expectedValue = CChar(1)
        guard let number = CFNumber.create(value: expectedValue, type: .charType) else {
            XCTFail()
            return
        }
        do {
            let value = try number.charValue()
            XCTAssertEqual(expectedValue, value)
        } catch {
            
        }
    }
    func testNumberCShort() {
        let expectedValue = CShort(1)
        guard let number = CFNumber.create(value: expectedValue, type: .shortType) else {
            XCTFail()
            return
        }
        do {
            let value = try number.shortValue()
            XCTAssertEqual(expectedValue, value)
        } catch {
            
        }
    }
    func testNumberFloat() {
        let expectedValue = Float(1.0)
        guard let number = CFNumber.create(value: expectedValue) else {
            XCTFail()
            return
        }
        do {
            let value = try number.floatValue()
            XCTAssertEqual(expectedValue, value)
        } catch {
            
        }
    }
    func testNumberDouble() {
        let expectedValue = 1.0
        guard let number = CFNumber.create(value: expectedValue) else {
            XCTFail()
            return
        }
        do {
            let value = try number.doubleValue()
            XCTAssertEqual(expectedValue, value)
        } catch {
            
        }
    }
    func testNumberCGFloat() {
        let expectedValue = CGFloat(1.0)
        guard let number = CFNumber.create(value: expectedValue) else {
            XCTFail()
            return
        }
        do {
            let value = try number.cgFloatValue()
            XCTAssertEqual(expectedValue, value)
        } catch {
            
        }
    }
    func testMismatch() {
        let expectedValue = CShort(3)
        guard let number = CFNumber.create(value: expectedValue, type: .intType) else {
            XCTFail()
            return
        }
        do {
            _ = try number.shortValue()
            XCTFail()
        } catch CFNumberError.typeMismatch {
            XCTAssertTrue(true)
        } catch {
            XCTFail()
        }
    }
    func testBool() {
        XCTAssertFalse(kCFBooleanFalse.boolValue)
        XCTAssertTrue(kCFBooleanTrue.boolValue)
        XCTAssertFalse(CFNumber.create(value: Int8(0))!.boolValue)
        XCTAssertTrue(CFNumber.create(value: Int8(1))!.boolValue)
        XCTAssertFalse(CFNumber.create(value: Int16(0))!.boolValue)
        XCTAssertTrue(CFNumber.create(value: Int16(1))!.boolValue)
        XCTAssertFalse(CFNumber.create(value: Int32(0))!.boolValue)
        XCTAssertTrue(CFNumber.create(value: Int32(1))!.boolValue)
        XCTAssertFalse(CFNumber.create(value: Int64(0))!.boolValue)
        XCTAssertTrue(CFNumber.create(value: Int64(1))!.boolValue)
        XCTAssertFalse(CFNumber.create(value: Int(0))!.boolValue)
        XCTAssertTrue(CFNumber.create(value: Int(1))!.boolValue)
        XCTAssertTrue(CFNumber.create(value: Float32(1), type: .float32Type)!.boolValue)
        XCTAssertTrue(CFNumber.create(value: Float64(1), type: .float64Type)!.boolValue)
        XCTAssertTrue(CFNumber.create(value: CChar(1), type: .charType)!.boolValue)
        XCTAssertTrue(CFNumber.create(value: CShort(1), type: .shortType)!.boolValue)
        XCTAssertTrue(CFNumber.create(value: Int32(1), type: .intType)!.boolValue)
        XCTAssertTrue(CFNumber.create(value: Int32(1), type: .intType)!.boolValue)
        XCTAssertTrue(CFNumber.create(value: CLong(1), type: .longType)!.boolValue)
        XCTAssertTrue(CFNumber.create(value: Float(1))!.boolValue)
        XCTAssertTrue(CFNumber.create(value: Double(1))!.boolValue)
        XCTAssertTrue(CFNumber.create(value: CFIndex(1), type: .cfIndexType)!.boolValue)
        XCTAssertTrue(CFNumber.create(value: CGFloat(1))!.boolValue)
    }
}
