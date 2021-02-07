//
//  ContentView.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-07.
//

import SwiftUI

struct ContentView: View {
    var recipes = [RecipeModel]()
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
        recipes.append(RecipeModel(id: UUID(), name: "Italian Pizza Chicken", origin: "Italian"))
        recipes.append(RecipeModel(id: UUID(), name: "Greek Pasta Bake", origin: "Greek"))
        recipes.append(RecipeModel(id: UUID(), name: "Hearty Parsnip Soup", origin: "British"))
        recipes.append(RecipeModel(id: UUID(), name: "Honey & Soy Salmon", origin: "Chinese"))
        return recipes
    }
}
