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
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            print(email, password)
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    // Handle the error (e.g., show an alert to the user)
                    print("Error creating user: \(error.localizedDescription)")
                    print("Error: \(error)")
                    return
                }
                
                // User created successfully
                if let user = authResult?.user {
                    print("Successfully registered user: \(user.email ?? "No email")")
                    
                    // Navigate to the next screen or perform additional actions
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
        
    }
    
}
