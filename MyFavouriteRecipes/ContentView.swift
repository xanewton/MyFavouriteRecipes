//
//  ContentView.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-07.
//

import SwiftUI

struct ContentView: View {
    #if DEBUG
    var recipes = ContentPreviewHelper.mockRecipes()
    #else
    var recipes = [RecipeModel]()
    #endif
    var body: some View {
        VStack(alignment: .leading) {
            List(recipes, id: \.id) { recipe in
                RecipeView(recipe: recipe)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(recipes: ContentPreviewHelper.mockRecipes())
    }
}

struct ContentPreviewHelper {
    static func mockRecipes() -> [RecipeModel] {
        var recipes = [RecipeModel]()
        recipes.append(RecipeModel(id: UUID(), name: "Italian Pizza Chicken", origin: "Italian", countryCode: "IT"))
        recipes.append(RecipeModel(id: UUID(), name: "Greek Pasta Bake", origin: "Greek", countryCode: "GR"))
        recipes.append(RecipeModel(id: UUID(), name: "Hearty Parsnip Soup", origin: "British", countryCode: "GB"))
        recipes.append(RecipeModel(id: UUID(), name: "Honey & Soy Salmon", origin: "Chinese", countryCode: "CN"))
        return recipes
    }
}
