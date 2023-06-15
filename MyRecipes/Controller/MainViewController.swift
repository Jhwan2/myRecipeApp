//
//  MainViewController.swift
//  MyRecipes
//
//  Created by 주환 on 2023/06/14.
//

import UIKit

private let reuseIdentifier = "MyCell23"

final class MainViewController: UICollectionViewController {
    
    let arr = [UIImage(systemName: "square.and.arrow.up.circle.fill"),
                       UIImage(systemName: "square.and.arrow.up.circle.fill"),
                       UIImage(systemName: "square.and.arrow.up.circle.fill"),
                       UIImage(systemName: "square.and.arrow.up.circle.fill") ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }

}

extension MainViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("4개개개")
        return arr.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        print("@@@@@@@@@@@@@@@@@@")
        let imageview = UIImageView(image: arr[indexPath.row])
        cell.backgroundView = imageview
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tap!!!!!@@")
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

