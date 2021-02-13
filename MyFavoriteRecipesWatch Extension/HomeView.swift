//
//  HomeView.swift
//  MyFavoriteRecipesWatch Extension
//
//  Created by newtan on 2021-02-13.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("My Favourite Recipes")
                .font(.callout)
            NavigationLink(destination: ContentView()) {
                Text("Show Recipes")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
