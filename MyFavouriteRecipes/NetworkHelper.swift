//
//  NetworkHelper.swift
//  MyFavouriteRecipes
//
//  Created by newtan on 2021-02-10.
//

import UIKit

class NetworkHelper: Any {
    
    // It accepts a type of URL (which we'll create shortly from a URL string), makes the call asynchronously, and, if successful, returns a type of UIImage.
    static func loadData(url: URL, completion: @escaping (UIImage?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            completion(UIImage(data: data))
        }.resume()
    }
}
