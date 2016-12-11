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
    
    
    
   /*required init(coder decoder: NSCoder) {
        name = String(decoder.decodeObject(forKey: "name") as! String)
        address = String(decoder.decodeObject(forKey: "address") as! String)
        id = Int(decoder.decodeObject(forKey: "id"))
    } */
    
    
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.address = decoder.decodeObject(forKey: "address") as? String ?? ""
        self.startDate = decoder.decodeObject(forKey: "date") as! Date
        self.id = decoder.decodeObject(forKey: "id") as? String ?? ""

    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(address, forKey: "address")
        coder.encode(startDate, forKey: "date")
        coder.encode(id, forKey: "id")

    }

    
    init(name : String, address : String, startDate : Date, id : String){
    
        self.name = name
        self.address = address
        self.startDate = startDate
        
        }
    
    
    
    
    
    
    
    
   /* void encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.name forKey:@"name"]
    [encoder encodeObject:self.categoryName forKey:@"startDate"]
    [encoder encodeObject:self.subCategoryName forKey:@"id"]
    [encoder encodeObject:self.subCategoryName forKey:@"address"]
    
    }
    
    (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
    //decode properties, other class vars
    self.question = [decoder decodeObjectForKey:@"name"];
    self.categoryName = [decoder decodeObjectForKey:@"startDate"];
    self.subCategoryName = [decoder decodeObjectForKey:@"id"];
    self.subCategoryName = [decoder decodeObjectForKey:@"address"];
    }
    return self;
    } */

    
    
    
    }


    

    
