//
//  myAnnotation.swift
//  SearchingBySport
//
//  Created by Jasmine on 15/12/2019.
//  Copyright © 2019 Jasmine. All rights reserved.
//

import MapKit

class MyAnnotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    // Marker Tint Color for discipline
    var markerTintColor: UIColor
    {
        switch discipline {
//        case "A":
//        return .red
//
//        case "B":
//        return .blue
        
        default:
        return .black
        }
   
    }
    
    
    var imageName: String?
    
    {
        if discipline == "Foot à 5" {return "Flag"}
        return nil
    }
    
}
