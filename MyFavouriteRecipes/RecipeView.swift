//
//  RecipeView.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-07.
//

import SwiftUI

struct RecipeView: View {
    var recipe = RecipeModel()
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(recipe.name)")
                .font(.headline)
                .foregroundColor(Color.blue)
                .bold()
            Text("\(recipe.origin)")
                .font(.subheadline)
                .foregroundColor(Color.purple)
                .italic()
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            RecipeView(recipe: RecipeModel(id: UUID(), name: "Italian Pizza Chicken", origin: "Italian"))
        }
    }
}
