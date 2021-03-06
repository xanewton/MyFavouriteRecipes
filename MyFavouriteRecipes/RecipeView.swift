//
//  RecipeView.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-07.
//

import SwiftUI

struct RecipeView: View {
    @State var recipe = RecipeModel()
    @EnvironmentObject var appData: AppData
    
    private var isFavourite: Bool {
        //return Helper.getFavourites().contains(where: {($0.name == recipe.name)})
        return appData.favourites.contains(where: {($0.name == recipe.name)})
    }
    
    var body: some View {
        Group {
            VStack(alignment: .leading) {
                Text("\(recipe.name)")
                    .font(.headline)
                    .foregroundColor(appData.fontColor)
                    .bold()
                //Image(recipe.countryCode)
                Image(uiImage: recipe.image).resizable()
                 .aspectRatio(contentMode: .fit)
                 .frame(height: 30)
            }
            VStack(alignment: .trailing, spacing: 10) {
                Button(action: {
                    Helper.addRemoveFavourite(recipe: self.recipe)
                    self.recipe.favourite.toggle()
                    self.appData.updateRecipe(recipe: self.recipe)
                    //self.appData.updateRecipeFavorite(recipe: self.recipe)
                }) {
                    //Image(systemName: Helper.isFavourite(name: recipe.name) ? "star.fill" : "star")
                    Image(systemName: isFavourite ? "star.fill" : "star")
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        let mockRecipes = Helper.mockRecipes()
        return List(mockRecipes, id: \.id) { recipe in
            RecipeView(recipe: recipe)
        }
    }
}
