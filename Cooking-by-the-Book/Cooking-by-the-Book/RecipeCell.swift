//
//  RecipeCell.swift
//  Cooking-by-the-Book
//
//  Created by Joey Thomas on 11/23/20.
//  Copyright © 2020 Cooking by the Book. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeAuthor: UILabel!
    @IBOutlet weak var savedButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
