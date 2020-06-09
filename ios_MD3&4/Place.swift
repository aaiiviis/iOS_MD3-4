//
//  Place.swift
//  ios_MD3&4
//
//  Created by Aivis Skangalis on 29.05.2020.
//  Copyright © 2020 Aivis Skangalis. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class Place: NSObject, MKAnnotation{
    
    let title: String?
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title:String, discipline:String, coordinate:CLLocationCoordinate2D) {
       
        self.title = title
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
        
    }
}

