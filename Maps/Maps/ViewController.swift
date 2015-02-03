//
//  ViewController.swift
//  Maps
//
//  Created by Jeanie House on 2/2/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//


//DONE   make the mapview show your current location (not as an annotation but as the blue dot)
// DONE make the annotation view show using title on an annotation (make the title be the name of the venue)
// DONEmake the mapview zoom to the annotations (maybe look for a region based on the annotations)
//DONE change the pin color
//add address for subtitle


import UIKit
import MapKit
import CoreLocation

    var onceToken:dispatch_once_t = 0


class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    var mapView = MKMapView()

    var lManager = CLLocationManager()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        mapView.delegate = self
        
        mapView.frame = view.frame
        
        view.addSubview(mapView)
        
        lManager.requestWhenInUseAuthorization()
        
        
        
        lManager.delegate = self
        
        lManager.desiredAccuracy = kCLLocationAccuracyBest
        
        lManager.distanceFilter = kCLDistanceFilterNone
        
        lManager.startUpdatingLocation()
   
        
        
        
    }
    
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        mapView.showsUserLocation = true
        
       
        
        dispatch_once(&onceToken) { () -> Void in
            
            println(locations.last)
            
            if let location = locations.last as? CLLocation {
                
              //  self.mapView.centerCoordinate = location.coordinate
                
                let span = MKCoordinateSpanMake(0.1, 0.1)
                
                let region = MKCoordinateRegion(center: location.coordinate, span: span)
                
                self.mapView.setRegion(region, animated: true)
                
                let venues = FourSquareRequest.requestVenuesWithLocation(location)
                
                
                println(venues)
                
                self.createAnnotationsWithVenues(venues)
                
                //request to foursquare for venues with location
                
                var annotationArray = self.mapView.annotations
                self.mapView.showAnnotations(annotationArray, animated: true)
         
                
                
                
                
            }
            
        }
        
        lManager.stopUpdatingLocation()
        
    }

    
    func createAnnotationsWithVenues(venues: [AnyObject]) {
        
        for venue in venues as [[String:AnyObject]] {
            
          
            
            let locationName = venue["name"] as String
            
            
            
            let locationInfo = venue["location"] as [String:AnyObject]
            
            let lat = locationInfo["lat"] as CLLocationDegrees
            let lng = locationInfo["lng"] as CLLocationDegrees
            
            let coordinate = CLLocationCoordinate2DMake(lat,lng)
            
            let annotation = MKPointAnnotation()
            
            annotation.setCoordinate(coordinate)
            
            mapView.addAnnotation(annotation)
            
            
            var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, lng)
            var information = MKPointAnnotation()
            information.coordinate = location
            information.title = locationName
            information.subtitle = "subtitle"

     
            mapView.addAnnotation(information)
                    }
       
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
    
        
        if annotation is MKUserLocation {
            //return nil so map view draws "blue dot" for standard user location
            return nil
        }
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
            pinView!.pinColor = .Purple
        }
        else {
            pinView!.annotation = annotation
        }
        
        return pinView
    }


}

