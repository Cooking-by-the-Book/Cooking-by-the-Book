//
//  ProfileViewController.swift
//  Cooking-by-the-Book
//
//  Created by Joey Thomas on 11/14/20.
//  Copyright © 2020 Cooking by the Book. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {

    var posts = [PFObject]()
    
    @IBOutlet weak var username: UILabel!
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
        let query = PFQuery(className: "Posts")
        query.includeKey("author")
        query.whereKey("author", equalTo: PFUser.current())
        query.order(byDescending: "createdAt")
        query.limit = 20
        
        query.findObjectsInBackground { (posts, error) in
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserPostCell", for: indexPath) as! UserPostCell
        let post = posts[indexPath.row]
        
        let user = post["author"] as! PFUser
        username.text = user.username
        
        let postImage = post["image"] as! PFFileObject
        let urlString = postImage.url!
        let url = URL(string: urlString)!
        
        cell.UserThumbail.af.setImage(withURL: url)
        return cell
    }
    
    @IBAction func onSignOut(_ sender: Any) {
        
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let mainPageViewController = main.instantiateViewController(identifier: "MainPageViewController")
        
        let delegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        delegate.window?.rootViewController = mainPageViewController
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
