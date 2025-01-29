//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        // Step 1: Safely unwrap the email and password from the text fields
        guard let email = emailTextfield.text, !email.isEmpty, // Ensure email is not empty
              let password = passwordTextfield.text, !password.isEmpty else { // Ensure password is not empty
            // Show a message or log if either field is empty
            print("Email or password is empty")
            return // Exit the function early since login cannot proceed without both fields
        }
        
        // Step 2: Attempt to sign in with Firebase Authentication
        Auth.auth().signIn(withEmail: email, password: password) {  authResult, error in
            // Step 4: Handle any errors from Firebase
            if let error = error {
                // Log the error and provide user feedback
                print("Error in user sign-in: \(error.localizedDescription)")
                return // Exit the closure since there’s an error
            }
            
            // Step 5: If sign-in is successful, proceed with the user
            if let user = authResult?.user {
                print("Successfully signed in user: \(user.email ?? "No email")")
                
                // Step 6: Navigate to the next screen
                // Use DispatchQueue.main.async to ensure this UI-related task runs on the main thread
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
    
}
