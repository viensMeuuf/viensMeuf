//
//  myAnnotationView.swift
//  ViensMeuf
//
//  Created by Jasmine on 16/12/2019.
//  Copyright © 2019 Jasmine. All rights reserved.
//

import MapKit

class myAnnotationView: MKAnnotationView

{
    override var annotation: MKAnnotation?
        
    {
        willSet
        {
            guard let _myAnnotation = newValue as? MyAnnotation else {return}
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

            
            tintColor = _myAnnotation.markerTintColor
//            
//            markerTintColor = _myAnnotation.markerTintColor
//
//            glyphText = String(_myAnnotation.discipline.first!)
//            
//            if let imageName = _myAnnotation.imageName
//
//            {
//                glyphImage = UIImage(named: imageName)
//            }
//            else
//            {
//                glyphImage = nil
//            }
//            
        }
    }
}
