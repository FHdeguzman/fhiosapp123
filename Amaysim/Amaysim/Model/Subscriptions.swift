//
//  Subscriptions.swift
//  Amaysim
//
//  Created by franz.deguzman on 04/06/2017.
//  Copyright © 2017 franz.deguzman. All rights reserved.
//

import Foundation
import UIKit

class Subscriptions : NSObject, NSCoding{
    
    var includedDataBalance = String()
    var expiryDate = String()
    
    
    override init(){
        self.includedDataBalance = String()
        self.expiryDate = String()
    }
    
    init(includedDataBalance : String, expiryDate  : String){
        self.includedDataBalance = includedDataBalance
        self.expiryDate = expiryDate
        
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let  expiryDate = aDecoder.decodeObject(forKey: "expiry-date") as! String
        let  includedDataBalance = aDecoder.decodeObject(forKey: "included-data-balance") as! String
        
        self.init(includedDataBalance  : includedDataBalance, expiryDate : expiryDate)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(includedDataBalance, forKey: "included-data-balance")
        aCoder.encode(expiryDate, forKey: "expiry-date")
    }
    
}


