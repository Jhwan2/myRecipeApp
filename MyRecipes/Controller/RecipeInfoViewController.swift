//
//  RecipeInfoViewController.swift
//  MyRecipes
//
//  Created by 주환 on 2023/06/26.
//

import UIKit

final class RecipeInfoViewController: UIViewController {
    
    var recipe: Recipe? = nil {
        didSet {
            configureUI()
        }
    }
    
    let imageView: UIImageView = UIImageView()
    
    let titleLabel: UILabel = UILabel()
    
    let tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        guard let recipe = recipe else { return }
        SoupManager.shared.fetchCooking(reciNum: recipe.recipeNum) { data in
            print("\(data)")
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        guard let recipe = recipe else { return }
        imageView.sd_setImage(with: recipe.imageUrl)
        imageView.center(inView: view)
        view.addSubview(titleLabel)
        titleLabel.text = recipe.title
        titleLabel.centerX(inView: view)
        titleLabel.anchor(top: imageView.bottomAnchor, paddingTop: 10)
        view.addSubview(tableView)
        tableView.backgroundColor = .blue
        tableView.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
    }
    
}
