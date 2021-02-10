//
//  RecipeModel.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-07.
//

import UIKit

struct RecipeModel: Identifiable, Codable {
    var id = UUID()
    var name = ""
    var origin = ""
    var favourite = false
    var countryCode = ""
    var ingredients = [String]()
    var recipe = ""
    var imageData: Data?
    var image: UIImage {
        if let dataImage = UIImage(data: imageData ?? Data()) {
            return dataImage
        } else if let countryImage = UIImage(named: countryCode) {
            return countryImage
        }
        return UIImage()
    }
}
