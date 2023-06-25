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

    func fetchOpenAiChat(ques: String, completion:@escaping(String) -> Void) {
        
        let query = ChatQuery(model: .gpt3_5Turbo, messages: [.init(role: .user, content: ques)])
        OpenAIManager.shared.openAI.chats(query: query) { result in
            switch result {
            case .success(let success):
                guard let res = success.choices.first?.message.content else { return }
                completion(res)
            case .failure(let failure):
                print("\(failure)")
            }
        }
    }
}
