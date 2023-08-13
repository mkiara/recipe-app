//
//  RecipeTableViewCell.swift
//  RecipeApp
//
//  Created by administrator on 13/08/2023.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var lblRecipeName: UILabel!
    @IBOutlet weak var lblRecipeDuration: UILabel!
    @IBOutlet weak var imgRecipe: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
