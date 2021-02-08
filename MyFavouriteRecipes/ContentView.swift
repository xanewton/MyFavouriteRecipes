//
//  ContentView.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-07.
//

import SwiftUI

struct ContentView: View {
    #if DEBUG
    var recipes = Helper.mockRecipes()
    #else
    var recipes = [RecipeModel]()
    #endif
    @State private var viewIndex = 0
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack {
                    Picker(selection: $viewIndex, label: Text("")) {
                        Text("Recipes").tag(0)
                        Text("Favourites").tag(1)
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    if viewIndex == 0 {
                        List(recipes, id: \.id) { recipe in
                            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                RecipeView(recipe: recipe)
                            }
                        }
                    } else if viewIndex == 1 {
                        List(Helper.getFavourites(), id: \.id) { recipe in
                            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                RecipeView(recipe: recipe)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("My Favourite Recipes"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(recipes: Helper.mockRecipes())
    }
}
