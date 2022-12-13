//
//  ProfileViewController.swift
//  simpleStock
//
//  Created by manuel  castro  on 11/17/22.
//

import UIKit
import Parse
import AlamofireImage
class ProfileViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var notifyLabel: UILabel!
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var ProfileIMG: UIImageView!
    
    @IBOutlet weak var userNameField: UITextField!
        
    
    @IBAction func TapImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true

        if UIImagePickerController.isSourceTypeAvailable(.camera){
            //if camera is available
            picker.sourceType = .photoLibrary
        } else {
            //if camera is not available
            picker.sourceType = .photoLibrary
        }

        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledimage = image.af.imageScaled(to: size)
        ProfileIMG.image = scaledimage
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    

    //    @IBAction func onback(_ sender: Any) {
//        //StockListViewController
//        let main = UIStoryboard(name: "Main", bundle: nil)
//
//        let loginViewController = main.instantiateViewController(withIdentifier: "StockListViewController")
//        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
//        delegate.window?.rootViewController = loginViewController
//
//    }
    
    
    
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
            
            userNameField.isUserInteractionEnabled = false
            
            usernameLabel.text = (firstNameField.text! + " " + lastNameField.text!)
            
            let imageFile = user["image"] as! PFFileObject
            
            let urlString = imageFile.url!
            let url = URL(string: urlString)!
            ProfileIMG.af.setImage(withURL: url)
            
            
            //ProfileIMG.image = user["image"] as? UIImage
            
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
            
            let imgData = ProfileIMG.image!.pngData()
            let file = PFFileObject(name: "image.png", data: imgData!)
            user["image"] = file
            
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
