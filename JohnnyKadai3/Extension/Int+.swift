//
//  Int+.swift
//  JohnnyKadai3
//
//  Created by Johnny Toda on 2022/03/12.
//

import Foundation

extension Int {
    func addingReportingOverflowWithError(_ ohter: Int) throws -> Int {
        let result = addingReportingOverflow(ohter)
        guard !result.overflow else {
            throw  OverflowError()
        }
        return result.partialValue
    }
}
