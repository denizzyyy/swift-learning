//
//  ViewController.swift
//  firstCalculator
//
//  Created by Deniz Yuca on 11.02.2026.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNum: UITextField!
    @IBOutlet weak var secondNum: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func plus(_ sender: Any) {
        let firstNumber = firstNum.text!
        let secondNumber = secondNum.text!
        if let firstNum = Double(firstNumber), let secondNum = Double(secondNumber){
            resultLabel.text = "\(firstNum + secondNum)"
        }
    }
    @IBAction func minus(_ sender: Any) {
        let firstNumber = firstNum.text!
        let secondNumber = secondNum.text!
        if let firstNum = Double(firstNumber), let secondNum = Double(secondNumber){
            resultLabel.text = "\(firstNum - secondNum)"
        }
    }
    @IBAction func multi(_ sender: Any) {
        let firstNumber = firstNum.text!
        let secondNumber = secondNum.text!
        if let firstNum = Double(firstNumber), let secondNum = Double(secondNumber){
            resultLabel.text = "\(firstNum * secondNum)"
        }
    }
    @IBAction func divide(_ sender: Any) {
        let firstNumber = firstNum.text!
        let secondNumber = secondNum.text!
        if let firstNum = Double(firstNumber), let secondNum = Double(secondNumber){
            resultLabel.text = "result: \(firstNum / secondNum)"
        }
    }
    

}

