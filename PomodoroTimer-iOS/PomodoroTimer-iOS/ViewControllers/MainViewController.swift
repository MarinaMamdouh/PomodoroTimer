//
//  ViewController.swift
//  PomodoroTimer-iOS
//
//  Created by Marina on 18/03/2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var minutesTextField: UITextField!
    
    @IBOutlet weak var secondsTextField: UITextField!
    
    @IBOutlet weak var timeStackView: UIStackView!
    
    @IBOutlet weak var timerMainView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    
    private var totalTimeInSeconds:Int!
    
    private var minutes:Int!
    
    private var seconds:Int!
    
    private var remainingMinutes:Int!
    
    private var remainingSeconds:Int!
    
    private var timer:Timer!
    
    private var timerIsInProgress:Bool = false
    
    private var timerIsResumed:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        timerMainView.entryAnimation(withDuration: 0.6, delay: 0, yShift: 30)
        startBtn.entryAnimation(withDuration: 0.6, delay: 0, yShift: 30)
        messageLabel.isHidden = true
        minutesTextField.delegate =  self
        secondsTextField.delegate =  self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startBtnClicked(_ sender: Any) {
        if(timerIsInProgress){
            stopTimer()
        }
        else{
            startTimer()
            messageLabel.isHidden = true
        }
    }
    
    func startTimer(){
        if let minutes = minutesTextField.text?.toInteger ,
           let seconds = secondsTextField.text?.toInteger{
            self.minutes =  minutes
            self.seconds = seconds
            self.remainingMinutes = minutes
            self.remainingSeconds = seconds
            minutesTextField.isEnabled =  false
            secondsTextField.isEnabled =  false
            totalTimeInSeconds = (minutes * 60) + seconds
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startCountingDown), userInfo: nil, repeats: true)
            startBtn.setTitle("Stop", for: .normal)
            timerIsInProgress = true
            
        }
        
    }
    
    func stopTimer(){
        timer.invalidate()
        timerIsInProgress =  false
        startBtn.setTitle("Resume", for: .normal)
        minutesTextField.isEnabled =  true
        secondsTextField.isEnabled =  true
    }
    
    @objc func startCountingDown(){
        if totalTimeInSeconds > 0{
            totalTimeInSeconds -= 1
            
            // update UI here
            if(remainingSeconds > 0){
                remainingSeconds -= 1
            }else{
                remainingMinutes -= 1
                remainingSeconds = 59
            }
            print("Counting \(remainingMinutes!) minutes and \(remainingSeconds!) seconds. ")
            minutesTextField.text = ((0...9).contains(remainingMinutes) ? "0\(remainingMinutes!)" : String(describing: remainingMinutes!))
            
            secondsTextField.text = ((0...9).contains(remainingSeconds) ? "0\(remainingSeconds!)" : String(describing: remainingSeconds!))
            
            
        }else{
            timer.invalidate()
            timerIsInProgress = false
            startBtn.setTitle("Start", for: .normal)
            messageLabel.isHidden =  false
            messageLabel.entryAnimation(withDuration: 0.6, delay: 0, yShift: 30)
            minutesTextField.text = (minutes == 0 ? "00" : String(describing: minutes!))
            minutesTextField.isEnabled =  true
            
            secondsTextField.text = (seconds == 0 ? "00" : String(describing: seconds!))
            secondsTextField.isEnabled = true
        }
    }
    

    
}


extension MainViewController:UITextFieldDelegate{
    
    @IBAction func minutestTextFieldTextChanged(_ sender: Any) {
        minutesTextField.text = handleTextFieldRestrictions(textField: minutesTextField.text)
    }
    
    
    @IBAction func secondsTextFieldTextChanged(_ sender: Any) {
        
        secondsTextField.text = handleTextFieldRestrictions(textField: secondsTextField.text)
    }

    
    func handleTextFieldRestrictions(textField:String?) -> String{
        let numberString = textField ?? "00"
        if(numberString.count > 2){
            let lastDigit = numberString.last
            let middleDigit = numberString[1]
            return "\(middleDigit)\(lastDigit!)"
            
        }else if(numberString.count == 1){
            return "0\(numberString)"
            
        }else if(numberString.count == 0){
            return "00"
        }
        
        return numberString
    }
    
}

