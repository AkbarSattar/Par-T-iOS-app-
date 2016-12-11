//
//  Persistance.swift
//  Par-T
//
//  Created by Akbar Sattar on 12/10/16.
//  Copyright © 2016 Akbar Sattar. All rights reserved.
//

import Foundation

import Foundation

class Persistance {
    
   // let pushupCountsKey = "pushupCounts"
    let partiesKey = "parties"
    
    func saveParty(party: Party) {
        let userDefaults = UserDefaults.standard
        
        var parties = fetchParties()
        
        parties.append(party)
        
        let data = NSKeyedArchiver.archivedData(withRootObject: parties)
        userDefaults.set(data, forKey: partiesKey)
        userDefaults.synchronize()
    }
    
    func fetchParties() -> [Party] {
        let userDefaults = UserDefaults.standard
        
        let parties = userDefaults.object(forKey: partiesKey) as? Data
        
        if let parties = parties {
            return NSKeyedUnarchiver.unarchiveObject(with: parties) as! [Party]
        }
        else{
            return [Party]()
        }
    }
    
}
