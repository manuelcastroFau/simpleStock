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
    

    @IBAction func onSave(_ sender: Any) {
    let user = PFUser()
        user.username = firstNameField.text
        user.username = lastNameField.text
        user.email = emailField.text

            // other fields can be set just like with PFObject
        user["phone"] = phoneField.text
        
        //user.saveInBackground { success, error in
          // if success {
                
               // performSegue(withIdentifier: nil, sender: nil)
               //  @Evel Honore: No segue being performed as of now but let me knoe where does this transiton to
            //}
           
      //  }
        
        
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
