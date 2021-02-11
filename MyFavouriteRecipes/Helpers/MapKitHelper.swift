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
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}
