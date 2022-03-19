//
//  UIViewController + Extension.swift
//  PomodoroTimer-iOS
//
//  Created by Marina on 19/03/2022.
//

import UIKit

// keyboard manegment
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
