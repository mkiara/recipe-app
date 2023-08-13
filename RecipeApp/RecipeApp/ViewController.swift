//
//  ViewController.swift
//  RecipeApp
//
//  Created by administrator on 13/08/2023.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedLogin(_ sender: Any) {
        
        guard
            let email = txtEmail.text,
            let password = txtPassword.text
        else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) {
            result, error in guard error == nil else { return self.displayError(error)}	
//            self.performSegue(withIdentifier: "loginSegue", sender: self)

        }
//        self.performSegue(withIdentifier: "loginSegue", sender: self)
    }
    

}

