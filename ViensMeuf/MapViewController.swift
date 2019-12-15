//
//  ViewController.swift
//  ViensMeuf
//
//  Created by Sohaib on 12/12/2019.
//  Copyright © 2019 Jasmine. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController {
    @IBOutlet weak var searchBarBySport: UISearchBar!
    
    
    @IBOutlet weak var eventCreationButton: UIButton!

    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var CalendarFilterbutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // - Map
        //important
        
//        map.delegate = self as? MKMapViewDelegate
//
//        map.register(myAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        
        
        //MY ANNOTATION
        //Initial location in Paris
        //48.886162,2.3581928/Paris
        setupUI()
        let initialLocation = CLLocation(latitude: 48.886162, longitude: 2.3581928)
        centerMapOnLocation(location: initialLocation)

    
    }
    
    //    MARK: - MAP FUNCTIONS
     
        
            // adding an annotation
        
        func setupUI() {
            let _annotation0 = MyAnnotation(title: "Football à 5", locationName: "Rue Riquet", discipline: "Football à 5", coordinate: CLLocationCoordinate2D(latitude: 48.886162, longitude: 2.3581928))
            map.addAnnotation(_annotation0)
            
            let _annotation1 = MyAnnotation(title: "Running", locationName: "Parc de Sceaux", discipline: "Footing", coordinate: CLLocationCoordinate2D(latitude: 48.7737751, longitude: 2.2613253))
            map.addAnnotation(_annotation1)
            
            let _annotation2 = MyAnnotation(title: "Ping-Pong", locationName: "Parc de Montsouris", discipline: "Ping-Pong", coordinate: CLLocationCoordinate2D(latitude: 48.8248858, longitude: 2.2677934))
            map.addAnnotation(_annotation2)
            
            let _annotation3 = MyAnnotation(title: "Badminton", locationName: "Parc de la Villette", discipline: "Badminton", coordinate: CLLocationCoordinate2D(latitude: 8.8938278, longitude: 2.3203915))
            map.addAnnotation(_annotation3)
            
            let _annotation4 = MyAnnotation(title: "Running", locationName: "Buttes-Chaumont", discipline: "Running", coordinate: CLLocationCoordinate2D(latitude: 48.8823028, longitude: 2.3117112))
            map.addAnnotation(_annotation4)
        }
        
        
        
    // Helper Functions
        let regionRadius: CLLocationDistance = 50000
        func centerMapOnLocation(location: CLLocation){
            
            let coordinateRegion = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            
            map.setRegion(coordinateRegion, animated: true)
            
            
        }

}

// MARK: - 1 extension Map

// To configure the Annotation View -> return a instance of MKAnnotationView

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) ->
        MKAnnotationView? {
            guard let _annotation = annotation as? MyAnnotation else {return nil}
            let _identifier = "marker"
            var view: MKAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: _identifier) as? MKMarkerAnnotationView
            {
                dequeuedView.annotation = annotation
                view = dequeuedView
            }
            
            else
            {
                view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: _identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            return view
    
    }

}
