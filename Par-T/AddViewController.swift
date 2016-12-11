//
//  AddViewController.swift
//  Par-T
//
//  Created by Akbar Sattar on 12/9/16.
//  Copyright © 2016 Akbar Sattar. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var EventTitleField: UITextField! //Title of the new party
    
    @IBOutlet weak var EventLabel: UILabel!
    @IBOutlet weak var EventLabel2: UILabel!
    
    @IBOutlet weak var EventLabel3: UILabel!
    
    @IBOutlet weak var AddressField: UITextField! //Address of the party
    
    
    @IBOutlet weak var DateSelect: UIDatePicker! //Datepicker to help us chose the time and date
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddNewParty(_ sender: Any) {
        
        var userDefaults:UserDefaults = UserDefaults.standard //Get what items we already have
        
        var eventList:NSMutableArray? = userDefaults.object(forKey: "partylist") as? NSMutableArray
        
      
        
        //Getting our model object from the text fields entered in
        var newParty : Party = Party(name: EventTitleField.text! , address : AddressField.text!, startDate : DateSelect.date , id : UUID().uuidString)
        
          let encodedData = NSKeyedArchiver.archivedData(withRootObject: newParty) //Turn it into NSData so that we can put it into UserDefaults
        
        var dataSet : NSMutableDictionary = NSMutableDictionary()
        dataSet.setObject(encodedData, forKey: "party" as NSCopying)
        
        if (eventList != nil){ //Adding something new on top of existing items
            var newList : NSMutableArray = NSMutableArray()
            
            for dict:Any in eventList!{
            newList.add(dict as! NSDictionary)
            
            }
            
            userDefaults.removeObject(forKey: "partylist")
            newList.add(dataSet)
            
            userDefaults.set(newList, forKey: "partylist")
        
        
        
        
        } //First item in the list
        else {
        eventList = NSMutableArray()
        eventList!.add(dataSet)
        
            userDefaults.set(eventList, forKey: "partylist")
        
        }
        
        userDefaults.synchronize()
        
        self.navigationController!.popToRootViewController(animated: true)
        
        
    }
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
