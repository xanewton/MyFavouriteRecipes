//
//  RecipeView.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-07.
//

import SwiftUI

struct RecipeView: View {
    @State var recipe = RecipeModel()
    var body: some View {
        Group {
            VStack(alignment: .leading) {
                Text("\(recipe.name)")
                    .font(.headline)
                    .foregroundColor(Color.blue)
                    .bold()
                Image(recipe.countryCode)
            }
            VStack(alignment: .trailing, spacing: 10) {
                Button(action: {
                    Helper.addRemoveFavourite(recipe: self.recipe)
                    self.recipe.favourite.toggle()
                }) {
                    Image(systemName: Helper.isFavourite(name: recipe.name) ? "star.fill" : "star")
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            RecipeView(recipe: RecipeModel(id: UUID(), name: "Italian Pizza Chicken", origin: "Italian", countryCode: "IT"))
        }
    }
}
