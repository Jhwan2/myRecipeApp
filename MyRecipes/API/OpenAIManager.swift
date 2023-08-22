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
    
    private var prompt: String {
"""
닭계장의 레시피를 알려줘
형식은
재료 :
레시피
1.
2.
이런식으로 만들어줘
"""
    }
    
    let openAI = OpenAI(apiToken: myKey)

    func fetchOpenAiChat(ques: String, completion:@escaping(String) -> Void) {
        let queryTest = CompletionsQuery(model: .textDavinci_003, prompt: prompt, temperature: 0, maxTokens: 1500, topP: 0.5, frequencyPenalty: 0, presencePenalty: 0, stop: ["\\n"], user: "skyov77")
        OpenAIManager.shared.openAI.completions(query: queryTest) { result in
            switch result {
            case .success(let success):
                let res = success.choices[0].text 
                completion(res)
            case .failure(let failure):
                print("\(failure.localizedDescription)")
            }
        }
        
//        let query = ChatQuery(model: .gpt3_5Turbo, messages: [.init(role: .user, content: ques)])
//        OpenAIManager.shared.openAI.chats(query: query) { result in
//            switch result {
//            case .success(let success):
//                guard let res = success.choices.first?.message.content else { return }
//                completion(res)
//            case .failure(let failure):
//                print("\(failure)")
//            }
//        }
        
    }
}
