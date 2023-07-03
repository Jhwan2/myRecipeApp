//
//  Soap.swift
//  MyRecipes
//
//  Created by 주환 on 2023/06/14.
//

import UIKit
import SwiftSoup

final class SoupManager {
    
    static let shared = SoupManager()
    
    private let rankUrl = URL(string: "https://www.10000recipe.com/ranking/home_new.html")!
    private let mainUrl = "https://www.10000recipe.com"
    
    
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
                    
                    let resNum: Element = try element.select("div.common_sp_thumb > a").first()!
                    let recipeNum: String = try resNum.attr("href")
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
                    
                    let nicknameEl: Element = try element.select("div.common_sp_caption_rv_name").first()!
                    let nickName: String = try nicknameEl.text()
                    
                    if recipes.count < 10 {
                        recipes.append(Recipe(imageUrl: imageurl, title: title, recipeNum: recipeNum, nickName: nickName))
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
    
    func fetchCooking(reciNum: String, completion: @escaping (CookingData?) -> Void) {
        
        let url = URL(string: mainUrl + reciNum)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("Failed to fetch data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            let html = String(data: data, encoding: .utf8)!
            
            do {
                let doc: Document = try SwiftSoup.parse(html)
                
                // Fetching ingredients
                let ingredientElements: Elements = try doc.select("div.ready_ingre3 ul:nth-child(2) li")
                var ingredients: [String] = []
                for element in ingredientElements.array() {
                    let ingredient: String = try element.text()
                    ingredients.append(ingredient)
                }
                
                // Fetching cooking steps
                let stepElements: Elements = try doc.select("div.view_step_cont")
                var steps: [Step] = []
                for element in stepElements.array() {
                    let step: String = try element.text()
                    // Step image
                    if let imageElement = try? element.select("img").first() {
                        let imageURL: String = try imageElement.attr("src")
                        guard let stepImageURL = URL(string: imageURL) else {continue}
                        steps.append(Step(instruction: step, imageUrl: stepImageURL))
                    } else {
                        print("Could not find image element")
                    }
                }
                
                let cookingData = CookingData(ingredients: ingredients, steps: steps)
                completion(cookingData)
                
            } catch Exception.Error(let type, let message) {
                print("\(type): \(message)")
                completion(nil)
            } catch {
                print("error")
                completion(nil)
            }
        }
        task.resume()
    }


}



