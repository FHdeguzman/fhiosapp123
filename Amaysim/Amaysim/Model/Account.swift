//
//  Account.swift
//  Amaysim
//
//  Created by franz.deguzman on 03/06/2017.
//  Copyright © 2017 franz.deguzman. All rights reserved.
//

import Foundation
import UIKit

class Account : NSObject, NSCoding{
    
    var title = String()
    var paymentType = String()

    
    var firstName = String()
    var lastName = String()
    var birthDate = String()
    
    var mobileNo = String()
    var email = String()
    
    override init(){
        self.firstName = String()
        self.lastName = String()
        self.birthDate = String()
        self.mobileNo = String()
        self.email = String()
        self.title = String()
        self.paymentType = String()
    }
    
    init(firstName : String, lastName  : String,  birthDate  :String, email : String, paymentType : String, title : String, mobileNo : String){
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate
        self.email = email
        self.title = title
        self.paymentType = paymentType
        self.mobileNo = mobileNo

    }
    
    required convenience init(coder aDecoder: NSCoder) {
        
        let  firstName = aDecoder.decodeObject(forKey: "first-name") as! String
        let  lastName = aDecoder.decodeObject(forKey: "last-name") as! String
        let  birthDate = aDecoder.decodeObject(forKey: "date-of-birth") as! String
        let  email = aDecoder.decodeObject(forKey: "email-address") as! String
        let  paymentType = aDecoder.decodeObject(forKey: "payment-type") as! String
        let  title = aDecoder.decodeObject(forKey: "title") as! String
        let  mobileNo = aDecoder.decodeObject(forKey: "contact-number") as! String
        
        
        self.init(firstName : firstName, lastName  : lastName, birthDate  :birthDate, email : email, paymentType : paymentType, title : title, mobileNo : mobileNo)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(firstName, forKey: "first-name")
        aCoder.encode(lastName, forKey: "last-name")
        aCoder.encode(birthDate, forKey: "date-of-birth")
        aCoder.encode(email, forKey: "email-address")
        aCoder.encode(title, forKey: "title")
        aCoder.encode(paymentType, forKey: "payment-type")
        aCoder.encode(mobileNo, forKey: "contact-number")
    }
    
}

