//
//  CFRunLoop.swift
//
//  Copyright © 2018-2021 Doug Russell. All rights reserved.
//

import CoreFoundation

public extension CFRunLoop {
    static var typeID: CFTypeID {
        CFRunLoopGetTypeID()
    }
    static var main: CFRunLoop {
        CFRunLoopGetMain()
    }
    static var current: CFRunLoop {
        CFRunLoopGetCurrent()
    }
    static func run() {
        CFRunLoopRun()
    }
    func add(source: CFRunLoopSource,
             mode: CFRunLoopMode = .defaultMode) {
        CFRunLoopAddSource(self,
                           source,
                           mode)
    }
    func remove(source: CFRunLoopSource,
                mode: CFRunLoopMode = .defaultMode) {
        CFRunLoopRemoveSource(self,
                              source,
                              mode)
    }
    func perform(mode: CFRunLoopMode = .defaultMode,
                 block: @escaping () -> Void) {
        CFRunLoopPerformBlock(self,
                              mode.rawValue,
                              block)
    }
}
