//
//  CFString.swift
//
//  Copyright © 2018-2021 Doug Russell. All rights reserved.
//

import Foundation

public extension CFString {
    static var typeID: CFTypeID {
        return CFStringGetTypeID()
    }
}
