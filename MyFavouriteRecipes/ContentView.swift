//
//  ContentView.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-07.
//

import SwiftUI

struct ContentView: View {
    /*
    #if DEBUG
    var recipes = Helper.mockRecipes()
    #else
    var recipes = [RecipeModel]()
    #endif
     */
    @State private var viewIndex = 0
    @State private var showAddRecipe = false
    @EnvironmentObject var appData: AppData
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack {
                    Picker(selection: $viewIndex, label: Text("")) {
                        Text("Recipes").tag(0)
                        Text("Favourites").tag(1)
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    if viewIndex == 0 {
                        List(appData.recipes, id: \.id) { recipe in
                            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                RecipeView(recipe: recipe)
                                    .navigationBarTitle(Text("Recipes"))
                            }
                        }
                    } else if viewIndex == 1 {
                        List(appData.favourites, id: \.id) { recipe in
                            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                RecipeView(recipe: recipe)
                                    .navigationBarTitle(Text("Favourites"))
                            }
                        }
                    }
                }
            }
            .navigationBarItems(trailing:
                Button(action: {
                    self.showAddRecipe.toggle()
                }) {
                if colorScheme == .dark {
                    Image(systemName: "plus")
                        .renderingMode(.original)
                        .colorInvert()
                } else {
                    Image(systemName: "plus")
                        .renderingMode(.original)
                }
                }.sheet(isPresented: $showAddRecipe) {
                    AddRecipeView().environmentObject(self.appData)
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let appData = AppData()
    
    static var previews: some View {
        appData.recipes = Helper.mockRecipes()
        return ContentView().environmentObject(appData)
    }
}


class AppData: ObservableObject {
    @Published var fontColor = Color.black
    @Published var recipes = [RecipeModel]()
    var favourites: [RecipeModel] {
        return recipes.filter({ $0.favourite == true })
    }

    func updateRecipe(recipe: RecipeModel) {
        recipes = recipes.filter( { $0.id != recipe.id } )
        recipes.append(recipe)
    }
    
    /*func updateRecipeFavorite(recipe: RecipeModel) {
        for item in recipes {
            if item.id == recipe.id {
                item.favourite = recipe.favourite
            }
        }
    }*/
}
