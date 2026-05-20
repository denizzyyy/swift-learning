//
//  ViewController.swift
//  AlertProject
//
//  Created by Deniz Yuca on 7.08.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var password2Text: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupClicked(_ sender: Any) {
        
        /*  let alert = UIAlertController(title: "Error!", message: "User not found!", preferredStyle: UIAlertController.Style.alert)
         let okButton = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
         // buton tıklanınca olacak şeyler
         print( "Buton clicked")
         }
         alert.addAction(okButton)
         self.present(alert, animated: true, completion: nil)
         */
        if usernameText.text == "" {
            makeAlert(titleInput: "Error!", messageInput: "Username not found!" )
        }
        else if passwordText.text == "" {
            makeAlert(titleInput: "Error!", messageInput: "Password not found!") }
        else if password2Text.text != passwordText.text {
            makeAlert(titleInput: "Error!", messageInput: "Passwords do not match!")
        }
        else {
            makeAlert(titleInput: "Success", messageInput: "User Created!")
        }
        
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}
