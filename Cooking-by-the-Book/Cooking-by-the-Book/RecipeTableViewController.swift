//
//  RecipeTableViewController.swift
//  Cooking-by-the-Book
//
//  Created by Joey Thomas on 11/23/20.
//  Copyright © 2020 Cooking by the Book. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class RecipeTableViewController: UITableViewController {
    
    var posts = [PFObject]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Posts")
        query.includeKey("author")
        query.order(byDescending: "createdAt")
        query.limit = 20
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil{
                self.posts = posts!
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as! RecipeCell
        
        

        let post = posts[indexPath.row]
        
        let user = post["author"] as! PFUser
        cell.recipeAuthor.text = user.username
        
        cell.recipeTitle.text = post["title"] as? String
        
        let imageFile = post["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string:urlString)!
        
        cell.recipeImage.af_setImage(withURL: url)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // Find the Recipe
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let recipe = posts[indexPath.row]
        
        // Send the recipe along to the details view
        let detailedViewController = segue.destination as! RecipeDetailsController
        
        detailedViewController.recipe = recipe
        
        
        
    }
    
    @IBAction func favoriteRecipe(_ sender: Any) {
//        let 
    }
    
}
