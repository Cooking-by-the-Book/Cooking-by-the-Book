//
//  MainPageViewController.swift
//  Cooking-by-the-Book
//
//  Created by Nathan Latronica on 11/7/20.
//  Copyright © 2020 Cooking by the Book. All rights reserved.
//

import UIKit
import Parse

class MainPageViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password)
            { (user, error) in
                if user != nil{
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else{
                    print("Error: \(error?.localizedDescription ?? "this did not go as planned")")
                    self.errorLabel.text = "\(error?.localizedDescription ?? "this did not go as planned")"
                    
                }
            
            }
    }
    
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error) in
          if success {
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
          } else{
            print("Error: \(error?.localizedDescription ?? "this did not go as planned")")
            self.errorLabel.text = "\(error?.localizedDescription ?? "this did not go as planned")"
          }
        }
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
