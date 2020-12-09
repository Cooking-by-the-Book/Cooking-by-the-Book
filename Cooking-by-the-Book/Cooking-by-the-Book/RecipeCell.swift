//
//  RecipeCell.swift
//  Cooking-by-the-Book
//
//  Created by Joey Thomas on 11/23/20.
//  Copyright © 2020 Cooking by the Book. All rights reserved.
//

import UIKit
import Parse

class RecipeCell: UITableViewCell {
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeAuthor: UILabel!
    @IBOutlet weak var savedButton: UIButton!
    
    var favorited:Bool = false
    var recipe: PFObject!
    
    
    @IBAction func saveRecipe(_ sender: Any) {
        // setFavorite(!favorited)
        let currentUser = PFUser.current()!
        let toBeFavorited = !favorited
        print(currentUser["savedPosts"] as? [PFObject] ?? [])
        if(toBeFavorited) {
            self.setFavorite(true)
            currentUser.add(recipe!, forKey: "savedPosts")
            currentUser.saveInBackground { (success, error) in
                if success{
                    print("liked a recipe")
                }
                else{
                    print(error?.localizedDescription ?? "Error in liking recipe")
                }
            }
        }
        else{
            self.setFavorite(false)
            currentUser.remove(recipe!, forKey: "savedPosts")
            currentUser.saveInBackground { (success, error) in
                if success{
                    print("unliked a recipe")
                }
                else{
                    print(error?.localizedDescription ?? "Error in unliking recipe")
                }
            }
        }
    }
    
    
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            savedButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            savedButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
