//
//  MapKitHelper.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-11.
//

import UIKit
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @State var lat = 0.0
    @State var long = 0.0
    
    var annotations: [AnnotationPin]
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
        
        view.addAnnotations(annotations)
    }
}


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