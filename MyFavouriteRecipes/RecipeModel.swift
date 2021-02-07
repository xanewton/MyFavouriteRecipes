//
//  RecipeModel.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-07.
//

import Foundation

// Simple model following the Observable pattern.
class RecipeModel: Identifiable, ObservableObject {
    @Published var recipes = [String]()
    var id = UUID()
    
    init() {
        // Simulate calling an API by hardcoding some text.
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.recipes.append(contentsOf: ["Pork & Potato Hotpot",
                                              "Thai Green Curry",
                                              "Italian Sausage & Beans"])
        }
    }
}
