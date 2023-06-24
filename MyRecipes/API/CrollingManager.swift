//
//  Soap.swift
//  MyRecipes
//
//  Created by 주환 on 2023/06/14.
//

import UIKit
import SwiftSoup

final class CrollingManager {
    
    static let shared = CrollingManager()

    let rankUrl = URL(string: "https://www.10000recipe.com/ranking/home_new.html")!
    
    
    func fetch(completion: @escaping([Recipe])-> Void) {
        let task = URLSession.shared.dataTask(with: rankUrl) { (data, response, error) in
            guard let data = data else {
                print("Failed to fetch data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            let html = String(data: data, encoding: .utf8)!
            var recipes: [Recipe] = []
            
            do {
                let doc = try SwiftSoup.parse(html)
                let elements: Elements = try doc.select("li.common_sp_list_li")
                for element in elements.array() {
                    let titleElement: Element = try element.select("div.common_sp_caption_tit.line2").first()!
                    let title: String = try titleElement.text()
                    
                    // Get all image elements
                    let imageElements: Elements = try element.select("div.common_sp_thumb img")
                    
                    // Check if there's more than one image, if so get the second one
                    let imageURL: String
                    if imageElements.array().count > 1 {
                        imageURL = try imageElements.array()[1].attr("src")
                    } else {
                        imageURL = try imageElements.array()[0].attr("src")
                    }
                    guard let imageurl = URL(string: imageURL) else {return }
                    
                    if recipes.count < 10 {
                        recipes.append(Recipe(imageUrl: imageurl, title: title))
                    } else {
                        DispatchQueue.main.async {
                            completion(recipes)
                        }
                        break
                    }
                }
                
            } catch Exception.Error(let type, let message) {
                print("\(type): \(message)")
            } catch {
                print("error")
            }
        }

        task.resume()

    }


}
