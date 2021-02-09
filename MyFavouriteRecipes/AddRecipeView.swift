//
//  AddRecipeView.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-09.
//

import SwiftUI

struct AddRecipeView: View {
    @State internal var recipeName: String = ""
    @State internal var ingredient: String = ""
    @State internal var ingredients = [String]()
    
    var body: some View {
        Form {
            Section(header: Text("Add Recipe Name:")) {
                TextField("enter recipe name", text: $recipeName)
            }
            Section(header: Text("Add Ingredient:")) {
                TextField("enter ingredient name", text: $ingredient)
            }
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
