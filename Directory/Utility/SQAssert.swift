//
//  SQAssert.swift
//  Directory
//
//  Created by Cole Roberts on 2/18/21.
//

import Foundation

func SQAssert(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
    assert(condition(), message(), file: file, line: line)
}

public func SQAssertMainThread() {
    assert(Thread.isMainThread)
}
