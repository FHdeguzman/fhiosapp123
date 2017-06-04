//
//  Products.swift
//  Amaysim
//
//  Created by franz.deguzman on 04/06/2017.
//  Copyright © 2017 franz.deguzman. All rights reserved.
//

import Foundation
import UIKit

class Products : NSObject, NSCoding{
    
    var name = String()
    var price = String()
    
    override init(){
        self.name = String()
        self.price = String()
    }
    
    init(name : String, price  : String){
        self.name = name
        self.price = price
        
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let  name = aDecoder.decodeObject(forKey: "name") as! String
        let  price = aDecoder.decodeObject(forKey: "price") as! String
        
        self.init(name  : name, price : price)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(price, forKey: "price")
    }
    
}

