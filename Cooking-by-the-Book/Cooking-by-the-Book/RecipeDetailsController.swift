//
//  RecipeDetailsController.swift
//  Cooking-by-the-Book
//
//  Created by Joey Thomas on 12/5/20.
//  Copyright © 2020 Cooking by the Book. All rights reserved.
//

import UIKit
import Parse

class RecipeDetailsController: UIViewController {
    
    var recipe: PFObject!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeAuthor: UILabel!
    @IBOutlet weak var recipeIngredients: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(recipe["title"] as! String)
        
        recipeTitle.text = recipe["title"] as? String
        recipeAuthor.text = (recipe["author"] as! PFUser).username
        recipeIngredients.text = recipe["ingredients"] as? String
        recipeIngredients.sizeToFit()
    
        let imageFile = recipe["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string:urlString)!
        
        recipeImage.af_setImage(withURL: url)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
