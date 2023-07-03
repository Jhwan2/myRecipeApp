//
//  myModel.swift
//  MyRecipes
//
//  Created by 주환 on 2023/06/17.
//

import Foundation
import UIKit

struct Recipe {
    let imageUrl: URL
    let title: String
    let recipeNum: String
    let nickName: String
    var cooking: CookingData?
}

struct CookingData {
    let ingredients: [String]
    let steps: [Step]
}

struct Step {
    var instruction: String
    var imageUrl: URL
}
