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
    
    @IBAction func backButton(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSaveButton(_ sender: Any) {
         var user = PFUser.current()!
        user["firstname"] = firstNameField.text
        user["lastname"] = lastNameField.text
        user["phone"] = phoneField.text
        user["email"] = emailField.text
        
        user.saveInBackground { sucess, error in
            if sucess {
                //The save data
            }
            else{
                //It failed to save
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
