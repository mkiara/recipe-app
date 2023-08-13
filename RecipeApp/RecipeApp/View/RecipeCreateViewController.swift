//
//  RecipeCreateViewController.swift
//  RecipeApp
//
//  Created by administrator on 13/08/2023.
//

import UIKit
import Firebase

class RecipeCreateViewController: UIViewController {
    
    var recipe: Recipe?
    
    @IBOutlet weak var txtRecipeName: UITextField!
    @IBOutlet weak var txtIngredients: UITextField!
    @IBOutlet weak var txtInstructions: UITextField!
    @IBOutlet weak var txtDuration: UITextField!
    
    let db = Firestore.firestore()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func tappedCreateRecipe(_ sender: Any) {
        
        if
            let recipeName = txtRecipeName,
            let recipeIngredients = txtIngredients,
            let recipeInstructions = txtInstructions,
            let recipeCreator = Auth.auth().currentUser?.email {
            
            // Add a new document with a generated ID
            var ref: DocumentReference? = nil
            
            ref = db.collection("recipe").addDocument(data: [
                "recipeName" : recipeName,
                "recipeImage" : "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80",
                "recipeIngredients": recipeIngredients,
                "recipeInstructions" : recipeInstructions,
                "recipeCreator" : recipeCreator,
                "recipeDate" : Date().timeIntervalSince1970
            ])  { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
            
            // Testing Data on Click
//            ref = db.collection("recipe").addDocument(data: [
//                "recipeName":"Tofu Salad",
//                "recipeImage": "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80",
//                "recipeIngredients": "1 recipe Baked Tofu*\n 4 cups chopped romaine lettuce \n4 cups chopped mixed greens \n1 handful cherry tomatoes \n1 ripe avocado \n2 radishes\n2 green onions\nSesame seeds, for garnish \nCarrot Ginger Dressing, Sesame Ginger Dressing or Tahini Dressing",
//                "recipeInstructions": "Put here and that and mix mix mix",
//                "recipeDuration": "20 minutes"
            
            
  //          ])

        }
    }
    

}
