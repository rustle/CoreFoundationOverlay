//
//  CFRunLoop.swift
//
//  Copyright © 2018 Doug Russell. All rights reserved.
//

import Foundation

public extension CFRunLoop {
    static var typeID: CFTypeID {
        return CFRunLoopGetTypeID()
    }
    static var main: CFRunLoop {
        return CFRunLoopGetMain()
    }
    static var current: CFRunLoop {
        return CFRunLoopGetCurrent()
    }
    static func run() {
        CFRunLoopRun()
    }
    func add(source: CFRunLoopSource, mode: CFRunLoopMode = .defaultMode) {
        CFRunLoopAddSource(self, source, mode)
    }
    func remove(source: CFRunLoopSource, mode: CFRunLoopMode = .defaultMode) {
        CFRunLoopRemoveSource(self, source, mode)
    }
    func perform(mode: CFRunLoopMode = .defaultMode, block: @escaping () -> Void) {
        CFRunLoopPerformBlock(self, mode.rawValue, block)
    }
}
