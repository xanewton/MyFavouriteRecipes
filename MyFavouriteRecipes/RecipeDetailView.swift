//
//  RecipeDetailView.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-08.
//

import SwiftUI

struct RecipeDetailView: View {
    @State var recipe: RecipeModel!
    @State private var viewIndex = 0
    @EnvironmentObject var appData: AppData
    
    private var isFavourite: Bool {
        return Helper.getFavourites().contains(where: {($0.name == recipe.name)})
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            // Image (currently using flag)
            Image(uiImage: recipe.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 200)

            // Remaining code will go here...
            HStack {
                // Name of our recipe
                Text("\(recipe.name)")
                    .font(.title)
                    .padding(.leading, 10)
                    .foregroundColor(appData.fontColor)
                            
                // Favourites Button
                Button(action: {
                    Helper.addRemoveFavourite(recipe: self.recipe)
                    appData.fontColor = self.isFavourite ? .orange : .black
                    self.recipe.favourite.toggle()
                    self.appData.updateRecipe(recipe: self.recipe)
                }) {
                    Image(systemName: isFavourite ? "star.fill" : "star")
                }
            }
                        
            // Recipe origin
            Text("Origin: \(recipe.origin)")
                .font(.subheadline)
                .padding(.leading, 10)
            
            // Picker to choose between Ingredients & Recipe
            Picker(selection: $viewIndex, label: Text("")) {
                Text("Ingredients").tag(0)
                Text("Recipe").tag(1)
            }.pickerStyle(SegmentedPickerStyle())
            
            // Logic to determine which Picker View to show.
            if viewIndex == 0 {
                List(recipe.ingredients, id: \.self) { ingredient in
                    Image(systemName: "hand.point.right")
                    Text(ingredient)
                }
                .listStyle(GroupedListStyle())
            } else if viewIndex == 1 {
                Text(recipe.recipe)
                    .padding(15)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Helper.mockRecipes().first!)
    }
}
