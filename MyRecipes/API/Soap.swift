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

    let url = URL(string: "https://www.10000recipe.com/recipe/6988334")!
    
    func fetch() {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("Failed to fetch data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            let html = String(data: data, encoding: .utf8)!
            do {
                let document = try SwiftSoup.parse(html)
                // 이 부분에서 필요한 데이터를 파싱합니다.
                let titleElement = try document.select("h3").first()
                let title = try titleElement?.text()
                print(title as Any)
            } catch Exception.Error(let type, let message) {
                print("\(type): \(message)")
            } catch {
                print("error")
            }
        }

        task.resume()

    }

}
