//
//  ContentView.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-07.
//

import SwiftUI

struct ContentView: View {
    let recipeNames = ["Italian Pizza Chicken", "Greek Pasta Bake", "Hearty Parsnip Soup"]
    @ObservedObject var recipeModel = RecipeModel()
    
    var body: some View {
         Group {
             VStack {
                 List(recipeNames, id: \.self) { name in
                     Text("\(name)")
                 }
                 List(recipeModel.recipes, id: \.self) { name in
                     Text("\(name)")
                 }
             }
         }
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
