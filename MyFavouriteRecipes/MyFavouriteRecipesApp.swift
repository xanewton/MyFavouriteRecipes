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
        /*
        #if DEBUG
        var recipes = Helper.mockRecipes()
        #else
        var recipes = [RecipeModel]()
        #endif
        */
        let mock = Helper.mockRecipes()
        appData.recipes = Helper.getRecipes()
        appData.recipes.append(contentsOf: mock)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appData)
        }
    }
}
