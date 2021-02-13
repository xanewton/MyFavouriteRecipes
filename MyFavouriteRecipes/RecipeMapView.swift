//
//  RecipeMapView.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-11.
//

import SwiftUI
import MapKit

struct RecipeMapView: View {
    
    @ObservedObject var locationManager = MapLocationManager()
    @Binding var filter: String
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appData: AppData
    
    var latitude: Double {
      return locationManager.location?.coordinate.latitude ?? 0.0
    }
      
    var longitude: Double {
      return locationManager.location?.coordinate.longitude ?? 0.0
    }
    
    var body: some View {
        VStack {
            Text("Recipes of the World!")
                .font(.headline)
                .padding()
                .multilineTextAlignment(.leading)
            MapView(lat: latitude,
                    long: longitude,
                    // annotations: Helper.getRecipeLocations(),
                    annotations: Helper.getRecipeLocations(recipes: appData.recipes),
                    presentationMode: presentationMode,
                    filter: $filter)
        }
    }
}

struct RecipeMapView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeMapView(filter: .constant(""))
    }
}
