//
//  String+Extension.swift
//  PomodoroTimer-iOS
//
//  Created by Marina on 19/03/2022.
//

import Foundation

extension String{
    var toInteger:Int?{
        let numberFormatter = NumberFormatter()
        let integer = numberFormatter.number(from: self)?.intValue
        return integer
    }
    
    subscript (i: Int) -> String {
            return self[i ..< i + 1]
    }
    
    subscript (r: Range<Int>) -> String {
            let range = Range(uncheckedBounds: (lower: max(0, min(count, r.lowerBound)),
                                                upper: min(count, max(0, r.upperBound))))
            let start = index(startIndex, offsetBy: range.lowerBound)
            let end = index(start, offsetBy: range.upperBound - range.lowerBound)
            return String(self[start ..< end])
        }
}
