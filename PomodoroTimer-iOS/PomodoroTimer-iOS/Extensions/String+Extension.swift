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
}
