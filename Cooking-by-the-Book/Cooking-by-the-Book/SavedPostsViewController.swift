//
//  SavedPostsViewController.swift
//  Cooking-by-the-Book
//
//  Created by Edgar Reyes on 12/8/20.
//  Copyright © 2020 Cooking by the Book. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class SavedPostsViewController: UINavigationController, UICollectionViewDataSource, UICollectionViewDelegate {
    
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
        var currentUser = PFUser.current()
        self.posts = currentUser?.value(forKey: "savedPosts") as! [PFObject]
        self.collectionView.reloadData()
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

}
