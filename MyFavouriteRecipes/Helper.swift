//
//  Helper.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-07.
//

import UIKit

struct Helper {
    
    static func saveRecipes(recipes: [RecipeModel]) {
        let data = try! JSONEncoder().encode(recipes)
        UserDefaults.standard.set(data, forKey: "recipes")
    }
        
    // Gets List of Saved Recipes
    static func getRecipes(filter: String = "") -> [RecipeModel] {
                
        if let data = UserDefaults.standard.data(forKey: "recipes") {
            var array = try! JSONDecoder().decode([RecipeModel].self, from: data)
            
            // Apply filter
            if filter != "" {
                array = array.filter { $0.origin == filter }
            }
            
            return array
        }
        return [RecipeModel]()
    }
    
    // Checks if recipe is already a Favourite
    static func isFavourite(name: String) -> Bool {
        return getFavourites().contains(where: {($0.name == name)})
    }
    
    // Adds or Removes Recipe from Favourites
    static func addRemoveFavourite(recipe: RecipeModel) {
        
        var favourites = getFavourites()
        if !isFavourite(name: recipe.name) {
            favourites.append(recipe)
        } else {
            favourites.removeAll(where: { $0.name == recipe.name })
        }
        
        let data = try! JSONEncoder().encode(favourites)
        UserDefaults.standard.set(data, forKey: "favourites")
        
    }
    
    // Gets List of Favourite Recipes
    static func getFavourites() -> [RecipeModel] {
        if let data = UserDefaults.standard.data(forKey: "favourites") {
            let array = try! JSONDecoder().decode([RecipeModel].self, from: data)
            return array
        }
        return [RecipeModel]()
    }
    
    // Gets list of mock data Recipes to be injected into our app.
    static func mockRecipes() -> [RecipeModel] {
        
        var recipies = [RecipeModel]()
        recipies.append(RecipeModel(name: "Italian Pizza Chicken", origin: "Italian", countryCode: "IT", ingredients: getMockIngredients(), recipe: getMockRecipe()))
        recipies.append(RecipeModel(name: "Greek Pasta Bake", origin: "Greek", countryCode: "GR", ingredients: getMockIngredients(), recipe: getMockRecipe()))
        recipies.append(RecipeModel(name: "Hearty Parsnip Soup", origin: "British", countryCode: "GB", ingredients: getMockIngredients(), recipe: getMockRecipe()))
        recipies.append(RecipeModel(name: "Honey & Soy Salmon", origin: "Chinese", countryCode: "CN", ingredients: getMockIngredients(), recipe: getMockRecipe()))
        
        return recipies
        
    }
    
    private static func getMockIngredients() -> [String] {
        return ["1 x Ingredient One",
            "2tbp Ingredient Two",
            "500g Ingredient Three",
            "2 x Ingredient Four"]
    }
        
    private static func getMockRecipe() -> String {
        return "Bacon ipsum dolor amet ad frankfurter pork aute nostrud leberkas jowl tenderloin dolore beef ribs. Ex tempor shankle, venison in ut cow deserunt. Do swine andouille, minim quis excepteur non shank eiusmod id buffalo. Duis shankle chuck picanha cow id minim esse. Qui burgdoggen capicola, venison culpa labore pastrami est minim bacon enim.\n\nExcepteur lorem turducken aute, qui ad hamburger chicken buffalo chislic brisket cupidatat pariatur. Jowl fugiat picanha pork belly quis. Ad shankle chuck est tri-tip ribeye sunt. Venison turkey tempor, occaecat beef biltong ut pork. Frankfurter sunt ad buffalo short loin cupidatat ipsum strip steak short ribs. Tri-tip porchetta fatback deserunt aute ut. Laborum nostrud aliquip pancetta deserunt, esse laboris pastrami."
    }
    
}

