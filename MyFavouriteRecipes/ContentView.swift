//
//  ContentView.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-07.
//

import SwiftUI

struct ContentView: View {
    var recipeNames = [String]()
    var body: some View {
            VStack {
                List(recipeNames, id: \.self) { name in
                    VStack {
                        Text("\(name)")
                            .font(.headline)
                        Text("\(name)")
                            .font(.subheadline)
                    }
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(recipeNames: ["Italian Pizza Chicken", "Greek Pasta Bake", "Hearty Parsnip Soup"])
    }
}
