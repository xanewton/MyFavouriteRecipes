//
//  ContentView.swift
//  MyFavoriteRecipesWatch Extension
//
//  Created by newtan on 2021-02-13.
//

import SwiftUI

struct ContentView: View {
    var recipes = [RecipeModel]()
    
    var body: some View {
        VStack {
            Text("Recipes")
                .font(.headline)
            List(recipes, id: \.id) { recipe in
                Text("\(recipe.name)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(recipes: Helper.mockRecipes())
    }
}
