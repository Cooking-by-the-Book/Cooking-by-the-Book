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
    var currentUser = PFUser.current()
    

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
        
        let objects = (currentUser?["savedPosts"] as? [PFObject]) ?? []
        var objectIds:[String] = []
        for object in objects {
            objectIds.append(object.objectId!)
        }
        
        if( objectIds.contains(post.objectId ?? "")){
            cell.setFavorite(true)
        }
        cell.recipe = post
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
            case "addRecipe":
                // Find the Recipe
                print("addRecipe")
                break
            case "detailedRecipe":
                print("detailedRecipe Time")
                let cell = sender as! UITableViewCell
                let indexPath = tableView.indexPath(for: cell)!
                let recipe = posts[indexPath.row]

                // Send the recipe along to the details view
                let detailedViewController = segue.destination as! RecipeDetailsController

                detailedViewController.recipe = recipe
                break
            default:
                print("unexpected segue identifier")
            }
        
        
    }
    
    @IBAction func favoriteRecipe(_ sender: Any) {
//        let 
    }
    
}
