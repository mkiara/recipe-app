//
//  HomeViewController.swift
//  RecipeApp
//
//  Created by administrator on 13/08/2023.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController, NavigationBarSetUpProtocol {

    @IBOutlet weak var lblEmail: UILabel!
    
    let firebaseAuth = Auth.auth()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
//        configureNavigationBar()
//        setNavBar(with: "HomePage")
        if let email = Auth.auth().currentUser?.email
        {
            lblEmail.text = email
        }
        
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue)
    {
        
        
    }
           
    @IBAction func tappedLogout(_ sender: Any) {

        
        
        
        
        print("Button Logout Tapped")
        
        do {
          try firebaseAuth.signOut()
                    self.dismiss(animated: true, completion: nil)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
        
    }
    
//    private func configureNavigationBar() {
//      navigationItem.title = "Welcome"
//      navigationItem.backBarButtonItem?.tintColor = .systemYellow
//      navigationController?.navigationBar.prefersLargeTitles = true
//    }

}
