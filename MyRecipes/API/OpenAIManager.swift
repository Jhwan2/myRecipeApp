//
//  OpenAIManager.swift
//  MyRecipes
//
//  Created by 주환 on 2023/06/15.
//

import OpenAI
import UIKit

final class OpenAIManager {
    
    static let shared = OpenAIManager()
    
    let openAI = OpenAI(apiToken: myKey)

    func fetchOpenAiChat(ques: String, completion:@escaping(ChatResult) -> Void) {
        
        let query = ChatQuery(model: .gpt3_5Turbo, messages: [.init(role: .user, content: ques)])
        OpenAIManager.shared.openAI.chats(query: query) { result in
            switch result {
            case .success(let success):
                completion(success)
            case .failure(let failure):
                print("\(failure)")
            }
        }
    }
}
