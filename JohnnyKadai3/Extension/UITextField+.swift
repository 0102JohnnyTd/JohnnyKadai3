//
//  UITextField+.swift
//  JohnnyKadai3
//
//  Created by Johnny Toda on 2022/03/10.
//

import UIKit

extension UITextField {
    var textToInt: Int {
        text.flatMap { Int($0) } ?? 0
    }
}
