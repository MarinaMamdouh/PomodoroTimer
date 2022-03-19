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

extension UIView{
    
    // Entry Animation with custom param duration, delay and y value shift
    func entryAnimation(withDuration:Double, delay:Double , yShift:Double){
        // shift the view center to the top by yshift
        self.center.y -= yShift
        // make the view fully transparent(hidden)
        self.alpha = 0
        UIView.animate(withDuration: withDuration, delay: delay, options: [.curveEaseOut, .transitionFlipFromBottom]) {
            // bring the alpha to its normal and return the view center to its original state
            self.alpha = 1
            self.center.y += yShift
        } completion: { sucess in
            
        }
    }
}
