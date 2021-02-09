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
                    .modifier(AddButton(text: $ingredient, ingredients: $ingredients))
            }
            
            if ingredients.count > 0 {
                Section(header: Text("Current Ingredients:")) {
                    List(ingredients, id: \.self) { item in
                        Button(action: {
                            self.ingredients.removeAll { $0 == item }
                        }) {
                        Image(systemName: "minus")
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                        }
                        .padding(.trailing, 8)
                        Text(item)
                    }
                }
            }
        }
    }
}

// Our own button modifier that checks the string text from the parent view
struct AddButton: ViewModifier {
    @Binding var text: String
    @Binding var ingredients: [String]
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            Button(action: {
                if self.text != "" {
                    self.ingredients.append(self.text)
                    self.text = ""
                }
            }) {
                Image(systemName: "plus")
                    .foregroundColor(Color(UIColor.opaqueSeparator))
            }
            .padding(.trailing, 8)
        }
    }
}


struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        let recipe = Helper.mockRecipes().first!
        return AddRecipeView(recipeName: recipe.name, ingredient: recipe.ingredients.first!, ingredients: recipe.ingredients)
    }
}
