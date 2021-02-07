//
//  RecipeModel.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-07.
//

import Foundation

struct RecipeModel: Identifiable, Hashable {
    var id = UUID()
    var name = ""
    var origin = ""
    var favourite = false
    var countryCode = ""
}
