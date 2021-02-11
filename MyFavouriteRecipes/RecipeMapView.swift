//
//  RecipeMapView.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-11.
//

import SwiftUI

struct RecipeMapView: View {
    var body: some View {
        MapView(lat: 37.3327177, long: -122.0753671, annotations: Helper.getMockLocations())
    }
}

struct RecipeMapView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeMapView()
    }
}
