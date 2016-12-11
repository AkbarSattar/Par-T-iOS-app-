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
    let persistance = Persistance()
    
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
        
        
        
        let party = Party(name: EventTitleField.text!, address: AddressField.text!, startDate: DateSelect.date, id: UUID().uuidString)
        
        persistance.saveParty(party: party)
        
   
        
        dismiss(animated: true, completion: nil)
        
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
