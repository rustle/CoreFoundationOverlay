//
//  CFArray.swift
//
//  Copyright © 2017-2021 Doug Russell. All rights reserved.
//

import CoreFoundation

public extension CFArray {
    static var typeID: CFTypeID {
        CFArrayGetTypeID()
    }
    func apply(_ applier: (CFTypeRef) throws -> Void) rethrows {
        try _apply(collection: self,
                   getCount: {
                       CFArrayGetCount(self)
                   },
                   getValues: { values, count in
                       CFArrayGetValues(self,
                                        CFRangeMake(0, count),
                                        values)
                   }, applier: applier)
    }
}
