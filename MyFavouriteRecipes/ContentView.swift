//
//  ContentView.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-12.
//

import SwiftUI

struct ContentView: View {
    @State private var showAddRecipe = false
    @State private var showMap = false
    
    @State private var filter: String = ""
    
    @EnvironmentObject var appData: AppData
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        // What we are doing here, though, is telling our navigation stack that, with DoubleColumnNavigationViewStyle, we want to utilize two views. The first will be our ListView() and the second will be our WelcomeView().
        // Once we select an item from our ListView(), the WelcomeView() will be overwritten with the RecipeDetailView() we've selected.
        NavigationView {
            ListView(filter: $filter, showAddRecipe: $showAddRecipe)
                .navigationBarTitle(Text(""), displayMode: .inline) // Hack!
                .navigationBarItems(leading: HStack {
                Button(action: {
                    self.showMap.toggle()
                }) {
                    if colorScheme == .dark {
                        Image(systemName: "map")
                            .renderingMode(.original)
                            .colorInvert()
                    } else {
                        Image(systemName: "map")
                            .renderingMode(.original)
                    }
                }.sheet(isPresented: $showMap) {
                    RecipeMapView(filter: self.$filter)
                }
                Button(action: {
                    self.filter = ""
                }) {
                    if colorScheme == .dark {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .renderingMode(.original)
                            .colorInvert()
                    } else {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .renderingMode(.original)
                    }
                }
                }, trailing:
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
                    AddRecipeView()
                })
            WelcomeView()
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

class AppData: ObservableObject {

    @Published var fontColor = Color.primary
    @Published var recipes = [RecipeModel]()
    
    var favourites: [RecipeModel] {
        return recipes.filter({ $0.favourite == true })
    }

    func updateRecipe(recipe: RecipeModel) {
        recipes = recipes.filter( { $0.id != recipe.id } )
        recipes.append(recipe)
    }
    
    func getRecipes(filter: String) -> [RecipeModel] {
        if filter != "" {
            return recipes.filter ({ $0.origin == filter })
        } else {
            return recipes
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let appData = AppData()
    static var previews: some View {
        return ContentView().environmentObject(appData)
    }
}
