//
//  MapViewController.swift
//  Par-T
//
//  Created by Akbar Sattar on 12/9/16.
//  Copyright © 2016 Akbar Sattar. All rights reserved.
//

import UIKit



class MapViewController: UIViewController {
    
    var partyData = Party(name : "", address : "", startDate : Date() , id : "")
    
    let persistance = Persistance()

    @IBOutlet weak var EventNameField: UILabel!
    
    @IBOutlet weak var EventDateField: UILabel!
    
    @IBOutlet weak var EventAddressField: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        EventNameField.text = partyData.name
        EventAddressField.text = partyData.address
        EventDateField.text = "\(partyData.startDate)"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
     
    }
    
    
    

}


