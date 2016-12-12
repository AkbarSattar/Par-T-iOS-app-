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
        
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)

        
        
        self.tableView.reloadData() }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.register(UINib(nibName: "PartyCell", bundle: nil), forCellReuseIdentifier: "Cell")

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        parties = persistance.fetchParties()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 //Original was 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        parties = persistance.fetchParties() //Gets the amount of parties and makes the proper number of cells
        return parties?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        
        parties? = persistance.fetchParties()
        
        if let parties = parties {
            let party = parties[indexPath.row]
            
            let formatter : DateFormatter = DateFormatter()
            formatter.dateFormat = ("MM/dd/yy - h:mm a")
            let dateString = formatter.string(from: party.startDate)
            
            
            //cell.textLabel?.text = "\(String(party.name)) - \(party.startDate)"
            //cell.textLabel?.text = (String(party.name)) + (String(party.address))
            cell.textLabel?.text = "\(party.name) - \(dateString)"
            

        }
        

        return cell
    }
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        parties? = persistance.fetchParties()

        if editingStyle == .delete {
            // Delete the row from the data source
                    
            //Remove the party at current index row
            persistance.removeParty(Int: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            
            
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

   
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
            
            mapViewController.partyData = theParty //Send our party over to MapViewController
            
        }
        
    }
    

}
