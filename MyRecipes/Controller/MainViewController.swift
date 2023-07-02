//
//  MainViewController.swift
//  MyRecipes
//
//  Created by 주환 on 2023/06/14.
//

import UIKit

private let reuseIdentifier = "MyCell23"

final class MainViewController: UICollectionViewController {
    
    var myRecipes: [Recipe] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionConfigure()
        fetchURL()
        navigationItem.title = "Recipe Rank 10"
    }
    
    private func collectionConfigure() {
        view.backgroundColor = .white
        self.collectionView.register(CustomCellView.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
        self.collectionView.collectionViewLayout = layout
    }
    
    func fetchURL() {
        SoupManager.shared.fetch { recipe in
            self.myRecipes = recipe
        }
//        OpenAIManager.shared.fetchOpenAiChat(ques: "냉장고에 김치, 소금, 간장, 밀가루가 있어 이재료로 요리 추천해줘") { res in
//            print(res)
//        }
    }

}

//MARK: Collectionview/ dataSource

extension MainViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myRecipes.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCellView
        
        let viewModel = CustomCellViewModel(recipe: myRecipes[indexPath.item])
        
        cell.mainImageView.sd_setImage(with: viewModel.imageUrl)
        cell.myTitle.text = viewModel.title
        cell.nickName.text = viewModel.nickName
        return cell
    }
    
}

//MARK: Collectionview/ delegate
extension MainViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = RecipeInfoViewController()
        vc.recipe = myRecipes[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
    }
}


//MARK: Collectionview/ flowlayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 400)
    }
}

