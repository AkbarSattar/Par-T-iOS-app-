//
//  MapViewController.swift
//  Par-T
//
//  Created by Akbar Sattar on 12/9/16.
//  Copyright © 2016 Akbar Sattar. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class MapViewController: UIViewController, MKMapViewDelegate {
    
    var partyData = Party(name : "", address : "", startDate : Date() , id : "")
    
    let persistance = Persistance()
    
    let locator = CLGeocoder()
    
    var firstCoords : CLLocationCoordinate2D!
    var firstCoordsSet = false

    @IBOutlet weak var EventNameField: UILabel!
    
    @IBOutlet weak var EventDateField: UILabel!
    
    @IBOutlet weak var MapView: MKMapView!
    
    @IBOutlet weak var EventAddressField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        MapView.delegate = self
        
        //Show the name, address, and date of the party on the bottom left corner
        EventNameField.text = partyData.name
        EventAddressField.text = partyData.address
        EventDateField.text = "\(partyData.startDate)"
        
        //CLGeocoder
        locator.geocodeAddressString(EventAddressField.text!, completionHandler:{(placemarks, error) -> Void in
            if (error != nil){
                
            //If we can't find the address, show the party name but tell the user the location was not found
            
                self.EventNameField.text = self.partyData.name
                self.EventAddressField.text = "Location not found, address invalid"
                self.EventDateField.text = "\(self.partyData.startDate)"
                
            } else {
                
            //If we CAN find the address, lets get some coordinates and place a point on them
            let placemark = placemarks? .first
            let coordinates = placemark?.location?.coordinate
            self.firstCoords = coordinates
                
                let annotation = MKPointAnnotation()
                let centerCoordinate = CLLocationCoordinate2D(latitude: self.firstCoords.latitude, longitude: self.firstCoords.longitude)
                
                //Point is on the center of the found location
                annotation.coordinate = centerCoordinate
                
                //Point will display a nametag that shows the name of the party
                annotation.title = self.EventNameField.text
                self.MapView.addAnnotation(annotation)
                
                //Zoom into where our point is
                let showregion: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(centerCoordinate, 500, 500)
                self.MapView.setRegion(showregion, animated: true)
            
            }
        
        } )
         /*
        
        
        locator.geocodeAddressString (EventAddressField.text!, completionHandler: {(placemarks , error) -> Void in
            if error != nil {
                if let placemark = placemarks?.first{
                    let coordinates = placemark.location?.coordinate
                    self.firstCoords = coordinates
                    self.firstCoordsSet = true
                    let annotation = MKPointAnnotation()
                    let centerCoordinate = CLLocationCoordinate2D(latitude: self.firstCoords.latitude, longitude: self.firstCoords.longitude)
                    annotation.coordinate = centerCoordinate
                    annotation.title = self.EventNameField.text
                    self.MapView.addAnnotation(annotation)
                
                }
                else {
                    let annotation = MKPointAnnotation()
                    let centerCoordinate = CLLocationCoordinate2D(latitude: self.firstCoords.latitude, longitude: self.firstCoords.longitude)
                    annotation.coordinate = centerCoordinate
                    annotation.title = self.EventNameField.text
                    self.MapView.addAnnotation(annotation)
                }
            }
        }
    )
    
        */
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


