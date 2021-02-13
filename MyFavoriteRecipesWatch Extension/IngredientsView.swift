//
//  IngredientsView.swift
//  MyFavoriteRecipesWatch Extension
//
//  Created by newtan on 2021-02-13.
//

import SwiftUI

struct IngredientsView: View {
    var ingredients = [String]()
    var recipeName = ""
    
    var body: some View {
        VStack {
            Text(recipeName)
                .font(.headline)
            List(ingredients, id: \.self) { ingredient in
                Text(ingredient)
            }
        }
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView(ingredients: Helper.getMockIngredients(), recipeName: "Ingredients")
    }
}
