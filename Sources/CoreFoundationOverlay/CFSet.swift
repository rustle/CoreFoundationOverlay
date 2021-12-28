//
//  CFArray.swift
//
//  Copyright © 2017-2021 Doug Russell. All rights reserved.
//

import CoreFoundation

public extension CFSet {
    static var typeID: CFTypeID {
        return CFSetGetTypeID()
    }
    func apply(_ applier: (CFTypeRef) throws -> Void) rethrows {
        try _apply(collection: self, getCount: {
            return CFSetGetCount(self)
        }, getValues: { values, count in
            CFSetGetValues(self, values)
        }, applier: applier)
    }
}
