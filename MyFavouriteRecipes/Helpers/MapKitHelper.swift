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
    
    @Binding var presentationMode: PresentationMode
    @Binding var filter: String
    
    func makeCoordinator() -> MapViewCoordinator{
        MapViewCoordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
        
        view.addAnnotations(annotations)
        view.delegate = context.coordinator
    }
    

    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ control: MapView) {
            self.parent = control
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
            annotationView.canShowCallout = true
            
            annotationView.image = UIImage(systemName: "book.fill")
            
            let btn = UIButton(type: .infoDark)
            annotationView.rightCalloutAccessoryView = btn
            
            return annotationView
        }
        
        // This delegate gets called whenever a UIControl item (UIButton, in our case) is tapped from inside a callout accessory.
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            parent.filter = (view.annotation?.title ?? "") ?? ""
            parent.presentationMode.dismiss()
        }
    }
}
