//
//  CookingCellViewModel.swift
//  MyRecipes
//
//  Created by 주환 on 2023/07/11.
//


import UIKit

struct CookingCellViewModel {
    
    private let step: Step
    
    var imageUrl: URL {
        return step.imageUrl
    }
    var instruction: String {
        return step.instruction
    }
    
    init(step: Step) {
        self.step = step
    }
    
    
}
