//
//  CoreFoundationOverlay.swift
//
//  Copyright © 2017-2021 Doug Russell. All rights reserved.
//

import CoreFoundation

@inlinable
func _apply(collection: CFTypeRef,
            getCount: () -> CFIndex,
            getValues: (UnsafeMutablePointer<UnsafeRawPointer?>, Int) -> Void,
            applier: (CFTypeRef) throws -> Void) rethrows {
    let count = Int(getCount())
    let values = UnsafeMutablePointer<UnsafeRawPointer?>.allocate(capacity: count)
    getValues(values, count)
    for i in 0..<count {
        guard let pointer = values[i] else {
            continue
        }
        let value = Unmanaged<CFTypeRef>.fromOpaque(pointer).takeUnretainedValue()
        try applier(value)
    }
    values.deallocate()
}
