//
//  HomeViewController.swift
//  Amaysim
//
//  Created by franz.deguzman on 03/06/2017.
//  Copyright © 2017 franz.deguzman. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var productNameLbl: UILabel!

    @IBOutlet var productPriceLbl: UILabel!
    @IBOutlet var emailLbl: UILabel!
    @IBOutlet var mobileniLbl: UILabel!
    @IBOutlet var birthdateLbl: UILabel!
    @IBOutlet var welcomeLbl: UILabel!
    
    @IBOutlet var includedDataBalanceLbl: UILabel!
    @IBOutlet var expiryDateLbl: UILabel!
    
    @IBOutlet var infoView: UIView!
    var account = Account()
    var subscription = Subscriptions()
    var products = Products()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated:true);
        
        
        do {
            if let file = Bundle.main.url(forResource: "collection", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    print(object)
                    
                    self.account = parseAccount(input: object["data"]! as! NSDictionary)
                    self.subscription = parseSubscription(input: object["included"]! as! NSArray)
                    self.products = parseProducts(input: object["included"]! as! NSArray)
                    
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


        
        welcomeLbl.text = "Welcome, \(account.firstName) \(account.lastName)!"
        birthdateLbl.text = account.birthDate
        emailLbl.text = account.email
        mobileniLbl.text = account.mobileNo
        productNameLbl.text = "Name: \(products.name)"
        productPriceLbl.text = "Price: $\(products.price)"
        
        
        
        includedDataBalanceLbl.text = "Included Data Balance: \(subscription.includedDataBalance) GB"
        expiryDateLbl.text = "Expiry Date: \(subscription.expiryDate)"
        
        
    }

    @IBAction func logOut(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let lpc = storyboard.instantiateViewController(withIdentifier: "landingPage") as! UINavigationController
        appDelegate.window?.rootViewController = lpc
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
