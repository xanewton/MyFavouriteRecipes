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
    
    @State internal var recipeDetails: String = ""
    @State internal var showingImagePicker = false
    @State private var libraryImage: UIImage?
    @State private var selectedCountry = 0
    
    @State private var angle: Double = 0
    @State private var validated = false
    @State var loadingImage = false
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appData: AppData
    
    internal var countries = Helper.getCountries()
    private var numberOfCountires: Int {
        return countries.count
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Country of Origin:")) {
                    // Note that the Picker requires a NavigationView as parent.
                    Picker(selection: $selectedCountry, label: Text("Country")) {
                        ForEach(0 ..< countries.count) {
                            Text(self.countries[$0]).tag($0)
                                .font(.headline)
                        }
                    }
                }
                Button(action: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        self.showingImagePicker.toggle()
                    }
                    self.angle = self.angle == 360 ? 0 : 360
                }) {
                    Image(uiImage: self.libraryImage ?? (UIImage(named: "placeholder-add-image") ?? UIImage()))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.purple, lineWidth: 3).shadow(radius: 10))
                        .frame(maxWidth: .infinity, maxHeight: 230)
                        .padding(6)
                    if loadingImage {
                        Text("fetching random image")
                            .transition(.asymmetric(insertion: .opacity, removal: .scale))
                    }
                }
                .accessibility(identifier: "accessibility.add.image.button")
                .rotation3DEffect(.degrees(angle), axis: (x: 0, y: 1, z: 0))
                .animation(.spring())
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(image: self.$libraryImage)
                }.buttonStyle(PlainButtonStyle())
                Button(action: {
                    self.getRandomImage()
                    withAnimation {
                        self.loadingImage.toggle()
                    }
                }) {
                    Text("Random Image")
                }
                Section(header: Text("Add Recipe Name:")) {
                    TextField("enter recipe name", text: $recipeName)
                        .accessibility(identifier: "accessibility.name.textfield")
                }
                Section(header: Text("Add Ingredient:")) {
                    TextField("enter ingredient name", text: $ingredient)
                        .accessibility(identifier: "accessibility.ingredient.textfield")
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
                        .accessibility(identifier: "accessibility.ingredient.list")
                    }
                }
                Section(header: Text("Details")) {
                    TextView(text: $recipeDetails)
                        .frame(height: 220)
                }
                Button(action: {
                    if self.recipeName != "" {
                        self.saveRecipe()
                        self.presentationMode.wrappedValue.dismiss()
                    } else {
                        withAnimation {
                            self.validated.toggle()
                        }
                    }
                }) {
                    Text("Save")
                }
                if validated {
                    Text("* Please give your recipe a name")
                        .foregroundColor(.red)
                        .bold()
                        .transition(.move(edge: .top))
                }
            } // Closing Form Brace
            .navigationBarTitle("Add Recipe")
        }// closing NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func getRandomImage() {
        // The public open API (https://source.unsplash.com/) will generate a placeholder image based on the structure of the URL.
        // https://source.unsplash.com/300x200/?food is a 300x200 size image categorized as food.
        guard let url = URL(string: "https://source.unsplash.com/300x200/?food") else {
            return
        }
        NetworkHelper.loadData(url: url) { (image) in
            self.libraryImage = image
            self.loadingImage.toggle()
        }
    }
    
    private func saveRecipe() {
        var recipeImage = UIImage()
        if let libImage = libraryImage {
            recipeImage = libImage
        }
        let country = countries[selectedCountry]
        let newRecipe = RecipeModel(id: UUID(),
                                    name: recipeName,
                                    origin: country,
                                    favourite: false,
                                    countryCode: Helper.getCountryCode(country: country),
                                    ingredients: ingredients,
                                    recipe: recipeDetails,
                                    imageData: recipeImage.jpegData(compressionQuality: 0.3) ?? Data())
        
        // Update Local Saved Data
        appData.recipes.append(newRecipe)
        Helper.saveRecipes(recipes: self.appData.recipes)
        WatchManager.sharedInstance.send(recipe: newRecipe)
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
            .accessibility(identifier: "accessibility.ingredient.add.button")
            .padding(.trailing, 8)
        }
    }
}


struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        let recipe = Helper.mockRecipes().first!
        return AddRecipeView(recipeName: recipe.name, ingredient: recipe.ingredients.first ?? "", ingredients: recipe.ingredients, recipeDetails: recipe.recipe)
    }
}
