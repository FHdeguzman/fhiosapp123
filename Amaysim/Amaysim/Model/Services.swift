//
//  Services.swift
//  Amaysim
//
//  Created by franz.deguzman on 04/06/2017.
//  Copyright © 2017 franz.deguzman. All rights reserved.
//

import Foundation
import UIKit

class Services : NSObject, NSCoding{
    
    var msn = String()
    var credit = String()
    var creditExpiry = String()
    
    override init(){
        self.msn = String()
        self.credit = String()
        self.creditExpiry = String()    }
    
    init(msn : String, credit  : String,  creditExpiry  : String){
        self.credit = credit
        self.msn = msn
        self.creditExpiry = creditExpiry
        
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let  creditExpiry = aDecoder.decodeObject(forKey: "credit-expiry") as! String
        let  msn = aDecoder.decodeObject(forKey: "msn") as! String
        let  credit = aDecoder.decodeObject(forKey: "credit") as! String
        
        self.init(msn : msn, credit  : credit, creditExpiry  :creditExpiry)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(creditExpiry, forKey: "credit-expiry")
        aCoder.encode(msn, forKey: "msn")
        aCoder.encode(credit, forKey: "credit")
    }
    
}


