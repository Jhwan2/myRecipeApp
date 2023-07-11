//
//  CustomCellViewModel.swift
//  MyRecipes
//
//  Created by 주환 on 2023/06/26.
//

import UIKit

struct CustomCellViewModel {
    
    private let recipe: Recipe
    
    var imageUrl: URL {
        return recipe.imageUrl
    }
    var title: String {
        return recipe.title
    }
    
    var nickName: String {
        return recipe.nickName
    }
    
    
}

