//
//  MasterTVController.swift
//  Par-T
//
//  Created by Akbar Sattar on 12/9/16.
//  Copyright © 2016 Akbar Sattar. All rights reserved.
//

import UIKit

class MasterTVController: UITableViewController {
    
    
    let persistance = Persistance()
    let cellIdentifier = "partyCell"
    var parties:[Party]?
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        //Use viewDidAppear because it appears when going back from addparty or mapview
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        
        
        self.tableView.reloadData() }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        parties = persistance.fetchParties()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        parties = persistance.fetchParties()
        //Gets the amount of parties and makes the proper number of cells
        
        //How many cells do we want? However many are in our userdefaults
        return parties?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        //Fetch all the parties from UserDefaults
        parties? = persistance.fetchParties()
        
        if let parties = parties {
            
            //Get the party we need from UserDefaults, corresponding to the table row
            let party = parties[indexPath.row]
            
            //Format the date
            let formatter : DateFormatter = DateFormatter()
            formatter.dateFormat = ("MM/dd/yy - h:mm a")
            
            //Get a string from the date formatter
            let dateString = formatter.string(from: party.startDate)
            
            //Set the cell in the format "Name - Date"
            cell.textLabel?.text = "\(party.name) - \(dateString)"
            
            
        }
        
        
        return cell
    }
    
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        parties? = persistance.fetchParties()
        
        if editingStyle == .delete {
            // Delete the row from the data source
            
            //Remove the party from userDefaults at the current row
            persistance.removeParty(Int: indexPath.row)
            
            //Delete the row on the tableview
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            
            
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        
        // Pass the selected object to the new view controller.
        parties? = persistance.fetchParties() //Get the parties
        
        if (segue.identifier == "SegwayFromCell"){
            
            let selectedIndexPath:IndexPath = self.tableView.indexPathForSelectedRow! // Find What row we're on
            
            let mapViewController:MapViewController = segue.destination as! MapViewController
            //Set the destination to MapViewController
            
            let theParty:Party = parties![selectedIndexPath.row]
            //Get the party stored at the row we're on
            
            mapViewController.partyData = theParty //Send our party over to MapViewController through partyData
            
        }
        
    }
    
    
}
