//
//  Party.swift
//  Par-T
//
//  Created by Akbar Sattar on 12/9/16.
//  Copyright © 2016 Akbar Sattar. All rights reserved.
//

import Foundation



class Party: NSObject,NSCoding{

    var name: String = ""
   
    
    var address: String = ""
    
    var startDate: Date
    
    
    var id = UUID().uuidString
    
    
//Make it so that the data can be stored to UserDefaults. Modified from the PushupApp
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.address = decoder.decodeObject(forKey: "address") as? String ?? ""
        self.startDate = (decoder.decodeObject(forKey: "date") as? Date)!
        self.id = decoder.decodeObject(forKey: "id") as? String ?? ""
        
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(address, forKey: "address")
        coder.encode(startDate, forKey: "date")
        coder.encode(id, forKey: "id")
        
    }
    
 //Initalize
    init(name : String, address : String, startDate : Date, id : String){
        
        self.name = name
        self.address = address
        self.startDate = startDate
    }
    
    

    
    
    }


    

    
