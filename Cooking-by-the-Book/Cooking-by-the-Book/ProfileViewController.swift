//
//  ProfileViewController.swift
//  Cooking-by-the-Book
//
//  Created by Joey Thomas on 11/14/20.
//  Copyright © 2020 Cooking by the Book. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignOut(_ sender: Any) {
        print("Help I'm stuck")
        
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
