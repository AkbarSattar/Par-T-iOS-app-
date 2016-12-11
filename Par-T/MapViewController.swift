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

        // Do any additional setup after loading the view.
        
        MapView.delegate = self
        
       // var coords = (lat: 0.0, long: 0.0)
        
        EventNameField.text = partyData.name
        EventAddressField.text = partyData.address
        EventDateField.text = "\(partyData.startDate)"
        
        locator.geocodeAddressString(EventAddressField.text!, completionHandler:{(placemarks, error) -> Void in
            if (error != nil){
                self.EventNameField.text = self.partyData.name
                self.EventAddressField.text = "Location not found"
                self.EventDateField.text = "\(self.partyData.startDate)"
                
            } else {
            let placemark = placemarks? .first
            let coordinates = placemark?.location?.coordinate
            self.firstCoords = coordinates
                let annotation = MKPointAnnotation()
                let centerCoordinate = CLLocationCoordinate2D(latitude: self.firstCoords.latitude, longitude: self.firstCoords.longitude)
                annotation.coordinate = centerCoordinate
                annotation.title = self.EventNameField.text
                self.MapView.addAnnotation(annotation)
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


