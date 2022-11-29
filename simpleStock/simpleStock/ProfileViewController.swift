//
//  ProfileViewController.swift
//  simpleStock
//
//  Created by manuel  castro  on 11/17/22.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {
    
    
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var notifyLabel: UILabel!
    
    
    @IBOutlet weak var userNameField: UITextField!
    
    @IBAction func onback(_ sender: Any) {
        //StockListViewController
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        let loginViewController = main.instantiateViewController(withIdentifier: "StockListViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        delegate.window?.rootViewController = loginViewController
        
    }
    
    
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        delegate.window?.rootViewController = loginViewController
    }
    
    override func viewDidLoad() {
        
        
        if PFUser.current() != nil {
            var user = PFUser.current()!
            firstNameField.text =  user["firstname"] as? String
            lastNameField.text = user["lastname"] as? String
            phoneField.text = user["phone"] as? String
            emailField.text = user["email"] as? String
            userNameField.text = user["username"] as? String
            
            notifyLabel.isHidden = true
            
            
        }
       
        
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSaveButton(_ sender: Any) {
        
        if PFUser.current() != nil {
            var user = PFUser.current()!
            user["firstname"] = firstNameField.text
            user["lastname"] = lastNameField.text
            user["phone"] = phoneField.text
            user["email"] = emailField.text
            
            user.saveInBackground { sucess, error in
                if sucess {
                    //The save data
                    print("Update user profile data updated succesfully")
                    self.notifyLabel.isHidden = false
                    self.notifyLabel.text = "Data Updated"

                    
                    
                }
                else{
                    //It failed to save
                    print("Update user profile data failed")
                    self.notifyLabel.text = "Update Failed"
                    self.notifyLabel.isHidden = false
                    
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
}
