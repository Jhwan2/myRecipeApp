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
    }
    
    private func collectionConfigure() {
        view.backgroundColor = .white
        self.collectionView.register(CustomCellView.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    func fetchURL() {
        CrollingManager.shared.fetch { recipe in
            self.myRecipes = recipe
            
        }
//        CrollingManager.shared.parseHTML()
    }

}

//MARK: Collectionview/ dataSource

extension MainViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myRecipes.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCellView
        cell.mainImageView.sd_setImage(with: myRecipes[indexPath.item].imageUrl)
        cell.myTitle.text = myRecipes[indexPath.item].title
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tap!!!!!@@")
    }
}

//MARK: Collectionview/ flowlayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
}

