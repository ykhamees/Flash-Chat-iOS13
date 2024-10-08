//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text ,let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let error {
                    self.showAlert(title: "Error", message: error.localizedDescription)
                } else {
                    self.showAlert(title: "Success", message: "User created successfully.")
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        } else {
            showAlert(title: "Error", message: "Please enter valid email and password.")
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
