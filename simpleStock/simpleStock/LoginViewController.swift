//
//  LoginViewController.swift
//  simpleStock
//
//  Created by manuel  castro  on 11/15/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
//    func test(){
//        let test = YahooAPI()
//        let grab = test.Getnews(company: "AAPL")
//        //print(grab)
//    }
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var messageLable: UILabel!
    
    //Please input login access
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.messageLable.text="Please input login access"
                self.messageLable.textColor=UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
                self.messageLable.textColor=UIColor(red: 1.00, green: 0.00, blue: 0.00, alpha: 1.00)
                self.messageLable.text = "Not valid user login data"
            }
        }
        
    }
    
    @IBAction func onSignUp(_ sender: Any) {
       // test()
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user.signUpInBackground { success, error in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
    }
    
    
    //Force close the keyboard if touch screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
