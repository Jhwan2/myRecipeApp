//
//  ViewController.swift
//  MyRecipes
//
//  Created by 주환 on 2023/06/14.
//

import UIKit
import OpenAI

final class MainTapController: UITabBarController {
    
    var isFirst = false
    
    var mybutton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("hihihi", for: .normal)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        userAndConfigureUI()
        configureTabUI()
        CrollingManager.shared.fetch()
//        OpenAIManager.shared.fetchOpenAiChat(ques: "나는 누구야?") { result in
//            print("\(result.choices.first?.message.content)")
//        }
    }
    
    private func userAndConfigureUI() {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: GuideViewController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            }
    }
    
    private func configureTabUI() {
        let main = MainViewController(collectionViewLayout: UICollectionViewLayout())
        let nav1 = templateNavigationController(image: UIImage(systemName: "puzzlepiece.extension"), rootViewController: main)
        
        let info = MyInfoViewController()
        let nav2 = templateNavigationController(image: UIImage(systemName: "theatermask.and.paintbrush.fill"), rootViewController: info)
        
        self.viewControllers = [nav1, nav2]
    }
    
    private func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        
        return nav
    }

}

