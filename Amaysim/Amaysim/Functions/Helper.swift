//
//  Helper.swift
//  Amaysim
//
//  Created by franz.deguzman on 04/06/2017.
//  Copyright © 2017 franz.deguzman. All rights reserved.
//

import Foundation
import UIKit

func showAlertWithTitle(title: String?, andMessage message: String?, withOkButtonTitle ok: String?, andCancelBurronTitle cancel: String?, completion: @escaping (_ returnAlert: UIAlertController, _ returnAlertButtonIndex:Int) -> Void) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    var buttonIndex = Int()
    
    if(cancel != nil){
        alert.addAction(UIAlertAction(title: cancel, style: UIAlertActionStyle.cancel, handler:  { action in
            buttonIndex = 1
            completion(alert, buttonIndex)
        }))
    }
    
    if(ok != nil ){
        alert.addAction(UIAlertAction(title: ok, style: UIAlertActionStyle.default, handler: { action in
            buttonIndex = 2
            completion(alert, buttonIndex)
        }))
    }
    
    completion(alert, buttonIndex)
}



var account = Account()
func parseAccount(input : NSDictionary) -> Account{
    
    if (input["type"] as! String ) == "accounts"{
        let attributes = input["attributes"] as! NSDictionary
        account = Account(firstName: attributes["first-name"] as! String, lastName: attributes["last-name"] as! String, birthDate: attributes["date-of-birth"] as! String, email: attributes["email-address"] as! String, paymentType: attributes["payment-type"] as! String, title: attributes["title"] as! String, mobileNo: attributes["contact-number"] as! String)
        
    }
    return account
}

var subscription = Subscriptions()
func parseSubscription(input : NSArray) -> Subscriptions{
    let subscriptionsDict = input[1] as! NSDictionary
    let attributes = subscriptionsDict["attributes"] as! NSDictionary
    subscription = Subscriptions(includedDataBalance: ("\((attributes["included-data-balance"] as! Double)/1000)"), expiryDate: (attributes["expiry-date"] as! String))
    return subscription
}


var products = Products()
func parseProducts(input : NSArray) -> Products{
    let productDict = input[2] as! NSDictionary
    let attributes = productDict["attributes"] as! NSDictionary
    products = Products(name: (attributes["name"] as! String), price: "\((attributes["price"] as! Double)/100)")
    return products
}


func getCredentials(input : NSArray) -> NSDictionary{
    let credentialsDict = input[0] as! NSDictionary
    let attributes = credentialsDict["attributes"] as! NSDictionary
    
    let credentials: NSDictionary = ["username" : "msn", "msn" : (attributes["msn"] as! String)]
    return credentials
    
}
