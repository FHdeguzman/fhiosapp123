//
//  LogInViewController.swift
//  Amaysim
//
//  Created by franz.deguzman on 03/06/2017.
//  Copyright © 2017 franz.deguzman. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet var usernameTxtfld: UITextField!
    @IBOutlet var passwordTxtfld: UITextField!
    var isPasswordShown = Bool()
    
    @IBOutlet var usernameDivider: UIView!
    @IBOutlet var passwordDivider: UIView!
    
    @IBOutlet var loginBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        formatNavigationBarController()
        
        //readJson()
        
        self.loginBtn.clipsToBounds = true
        self.loginBtn.layer.masksToBounds = true
        self.loginBtn.layer.cornerRadius = 3
        
        let tapper = UITapGestureRecognizer(target: self, action: #selector(LogInViewController.tapOutsideTextfield(_:)))
        tapper.cancelsTouchesInView = false
        self.view!.addGestureRecognizer(tapper)
    }
    
    func tapOutsideTextfield(_ sender: UITapGestureRecognizer) {
        self.view!.endEditing(true)
    }
    
    @IBAction func showPassword(_ sender: Any) {
        if !isPasswordShown{
            passwordTxtfld.isSecureTextEntry = false
            
            isPasswordShown = true
        }else{
            passwordTxtfld.isSecureTextEntry = true
            isPasswordShown = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var credentials = NSDictionary()
    var enteredCredentials = NSDictionary()
    
    @IBAction func logIn(_ sender: Any) {
        
        do {
            if let file = Bundle.main.url(forResource: "collection", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    print(object)
                    
                    self.credentials = getCredentials(input: object["included"]! as! NSArray)
                    
                    
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }

        self.enteredCredentials = ["username" : usernameTxtfld.text!, "msn" : passwordTxtfld.text!]
        
        if credentials == enteredCredentials {
            self.performSegue(withIdentifier: "home", sender: self)
        }else{
            showAlertWithTitle(title: nil, andMessage: "Invalid Credentilas", withOkButtonTitle: "Either username or password is incorrect", andCancelBurronTitle: "Dismiss"){(returnAlert: UIAlertController,returnAlertButtonIndex:Int) -> Void in
                switch (returnAlertButtonIndex) {
                case 0:
                    self.present(returnAlert, animated: true, completion: nil)
                    break
                case 1:
                    
                    break
                case 2:
                    
                    break
                default:
                    break
                }
            }

        }
        
        
        
    }

    func formatNavigationBarController(){
        self.title = ""
        // Sets the color of the navigation bar and clears the shadow
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.tintColor = Properties.Color.darkPrimaryColor
    }

}
