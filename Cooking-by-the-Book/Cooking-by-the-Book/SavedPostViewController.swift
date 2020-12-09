//
//  SavedPostViewController.swift
//  Cooking-by-the-Book
//
//  Created by Edgar Reyes on 12/8/20.
//  Copyright © 2020 Cooking by the Book. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class SavedPostViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var posts = [PFObject]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 0
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 2
        layout.itemSize = CGSize(width: width, height: width)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let currentUser = PFUser.current()
        let objects = (currentUser?["savedPosts"] as? [PFObject]) ?? []
        var objectIds:[String] = []
        for object in objects {
            objectIds.append(object.objectId!)
        }
        let query = PFQuery(className: "Posts")
        query.includeKey("author")
        query.whereKey("objectId", containedIn: objectIds)
        query.findObjectsInBackground {(posts, error) in
            if posts != nil {
                self.posts = posts!
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return posts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SavedPostCell", for: indexPath) as! SavedPostCell
        let post = posts[indexPath.row]

        let postImage = post["image"] as! PFFileObject
        let urlString = postImage.url!
        let url = URL(string: urlString)!

        cell.savedThumbnail.af.setImage(withURL: url)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)!
        let recipe = posts[indexPath.row]
        
        // Send the recipe along to the details view
        let detailedViewController = segue.destination as! RecipeDetailsController
        
        detailedViewController.recipe = recipe
    }
}
