//
//  MyFavouriteRecipesApp.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-07.
//

import SwiftUI

@main
struct MyFavouriteRecipesApp: App {
    let appData = AppData()
    init() {
        //appData.recipes = Helper.getRecipes()
        appData.recipes = Helper.mockRecipes()
    }
    
    var body: some Scene {
        WindowGroup {
            //RecipeMapView()
            ContentView()
                .environmentObject(appData)
        }
    }
}
