//
//  RecipeMapView.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-11.
//

import SwiftUI

struct RecipeMapView: View {
    
    @ObservedObject var locationManager = MapLocationManager()
    
    @Binding var filter: String
      
    @Environment(\.presentationMode) var presentationMode
    
    var latitude: Double {
      return locationManager.location?.coordinate.latitude ?? 0.0
    }
      
    var longitude: Double {
      return locationManager.location?.coordinate.longitude ?? 0.0
    }
    
    
    var body: some View {
        NavigationView {
            MapView(lat: latitude, long: longitude, annotations: Helper.getMockLocations(), presentationMode: presentationMode, filter: $filter)
                .navigationBarTitle(Text("Recipes of the World!"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct RecipeMapView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeMapView(filter: .constant(""))
    }
}
