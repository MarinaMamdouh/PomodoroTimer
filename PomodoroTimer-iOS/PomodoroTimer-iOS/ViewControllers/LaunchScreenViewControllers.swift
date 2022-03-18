//
//  LaunchScreenViewControllers.swift
//  PomodoroTimer-iOS
//
//  Created by Marina on 18/03/2022.
//

import UIKit

class LaunchScreenViewControllers: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.startApp()
    }
    
    private func startApp(){
        let mainSegueIdentifier = "goToMain"
        self.performSegue(withIdentifier: mainSegueIdentifier, sender: nil)
    }


}
