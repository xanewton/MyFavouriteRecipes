//
//  WatchHelper.swift
//  MyFavoriteRecipesWatch Extension
//
//  Created by newtan on 2021-02-13.
//

import UIKit

class WatchHelper: Any {

    // Add Recipe
    static func addRecipe(recipeString: String) -> [RecipeModel] {
        var recipes = getRecipes()
        let recipe = RecipeModel.createFrom(json: recipeString)
        recipes.append(recipe)
        
        do {
            let data = try JSONEncoder().encode(recipes)
            UserDefaults.standard.set(data, forKey: "recipes")
        } catch {
            print("Unable to persist recipe")
        }
        return getRecipes()
    }
    
    static func getRecipes() -> [RecipeModel] {
        if let data = UserDefaults.standard.data(forKey: "recipes") {
            let array = try! JSONDecoder().decode([RecipeModel].self, from: data)
            return array
        }
        return [RecipeModel]()
    }
}
