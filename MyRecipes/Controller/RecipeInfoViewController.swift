//
//  RecipeInfoViewController.swift
//  MyRecipes
//
//  Created by 주환 on 2023/06/26.
//

import UIKit

private let reuseIdentifier = "RecipeInfoCell"

final class RecipeInfoViewController: UIViewController {
    
    var recipe: Recipe? = nil {
        didSet {
            DispatchQueue.main.async {
                self.configureUI()
                self.tableView.reloadData()
            }
        }
    }
    
    var imageView: UIImageView = UIImageView()
    
    let titleLabel: UILabel = UILabel()
    
    let ingredientLabel = UILabel()
    
    var tableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
        guard let recipe = recipe else { return }
        SoupManager.shared.fetchCooking(reciNum: recipe.recipeNum) { data in
            self.recipe?.cooking = data
//            print("\(data?.steps.count)")
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        guard let recipe = recipe else { return }
        imageView.sd_setImage(with: recipe.imageUrl)
        imageView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        view.addSubview(titleLabel)
        titleLabel.text = recipe.title
        titleLabel.centerX(inView: view)
        titleLabel.anchor(top: imageView.bottomAnchor, paddingTop: 10)
        view.addSubview(ingredientLabel)
        ingredientLabel.anchor(top: titleLabel.bottomAnchor,paddingTop: 10)
        ingredientLabel.text = recipe.cooking?.ingredients.first
        ingredientLabel.centerX(inView: view)
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.anchor(top: ingredientLabel.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CookingCell.self, forCellReuseIdentifier: reuseIdentifier)
//        tableView.register(CookingCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 175
        tableView.backgroundColor = .white
    }
    
}



//MARK: UITableView/ DataSource
extension RecipeInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let num = recipe?.cooking?.steps.count else { return 0 }
        return num
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CookingCell
        
        guard let step = recipe?.cooking?.steps[indexPath.row] else { print("error")
            return cell
        }
        cell.step = step
        cell.backgroundColor = .white
        return cell
    }
    
}

// MARK: UITableView/Delegate
extension RecipeInfoViewController: UITableViewDelegate {

}

