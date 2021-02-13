//
//  AnnotationPin.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-13.
//

import UIKit
import SwiftUI
import MapKit

// Basic subclass of MKAnnotation.
class AnnotationPin: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
