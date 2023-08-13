//
//  RecipeListViewController.swift
//  RecipeApp
//
//  Created by administrator on 13/08/2023.
//

import UIKit
import Firebase

class RecipeListViewController: UIViewController {
    
    var recipes: [Recipe] = [
        Recipe(recipeName: "Nasi Ayam", recipeImage: "https://images.unsplash.com/photo-1569058242252-623df46b5025?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80",recipeIngredients: "1. Ayam\n2.Beras\n3.Salad", recipeInstructions: "1. Basuh beras \n 2. Basuh ayam \n 3. Masak nasi", recipeDuration: "1 jam", recipeCreator: "Normah", recipeDate: "12/12/2022", recipeCategory: "Lauk Pauk"),
        Recipe(recipeName: "Nasi Goreng", recipeImage: "https://images.unsplash.com/photo-1512058564366-18510be2db19?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDd8fGNoaWNrZW4lMjByaWNlfGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60",recipeIngredients: "1. Ayam\n2.Beras\n3.Salad", recipeInstructions: "1. Basuh beras \n 2. Basuh ayam \n 3. Masak nasi", recipeDuration: "1 jam", recipeCreator: "Normah", recipeDate: "12/12/2022", recipeCategory: "Lauk Pauk"),
        Recipe(recipeName: "Fried Chicken", recipeImage: "https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjN8fGNoaWNrZW4lMjByaWNlfGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60",recipeIngredients: "1. Ayam\n2.Beras\n3.Salad", recipeInstructions: "1. Basuh beras \n 2. Basuh ayam \n 3. Masak nasi", recipeDuration: "1 jam", recipeCreator: "Normah", recipeDate: "12/12/2022", recipeCategory: "Lauk Pauk"),
        Recipe(recipeName: "Salmon Steak", recipeImage: "https://images.unsplash.com/photo-1580476262798-bddd9f4b7369?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2FsbW9uJTIwc3RlYWt8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=400&q=60",recipeIngredients: "1. Ayam\n2.Beras\n3.Salad", recipeInstructions: "1. Basuh beras \n 2. Basuh ayam \n 3. Masak nasi", recipeDuration: "1 jam", recipeCreator: "Normah", recipeDate: "12/12/2022", recipeCategory: "Lauk Pauk")
    ]

    @IBOutlet weak var recipeListTableView: UITableView!
    let cellSpacingHeight : CGFloat = 10
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.recipeListTableView.delegate = self
        self.recipeListTableView.dataSource = self
        
        readDataFromFireStore()
    }
    
    func readDataFromFireStore() {
        db.collection("recipe").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    
                }
            }
        }
    }
    
    func configureCellText(for cell: UITableViewCell, with item:Recipe) {
        if let recipeCell = cell as? RecipeTableViewCell {
            
            let url = URL(string: item.recipeImage)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                recipeCell.imgRecipe.image = UIImage(data: data!)
            }
        }
        
        

//            recipeCell.imgRecipe.image = imageView.image
            recipeCell.lblRecipeName.text = item.recipeName
            recipeCell.lblRecipeDuration.text = item.recipeDuration

        }
    }


}


extension RecipeListViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath)
        
        let recipe: Recipe
        
        recipe = recipes[indexPath.row]
        
        configureCellText(for: cell, with:recipe)
        
        return cell
    }
    

}
