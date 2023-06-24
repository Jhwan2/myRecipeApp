//
//  CustomCellView.swift
//  MyRecipes
//
//  Created by 주환 on 2023/06/17.
//

import SDWebImage
import UIKit

class CustomCellView: UICollectionViewCell {
    
    private let mainView: UIView = {
       let view = UIView()
        view.frame = .init(x: 0, y: 0, width: 300, height: 300)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 20
        return view
    }()
    
    let mainImageView: UIImageView = {
       let imageview = UIImageView()
//        imageview.image = UIImage(systemName: "plus")
        imageview.contentMode = .scaleAspectFit
        imageview.layer.cornerRadius = 20
//        imageview.sd_setImage(with: <#T##URL?#>)
        return imageview
    }()
    
    var myTitle: UILabel = {
       let label = UILabel()
        label.text = "hiho"
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        addSubview(mainView)
        addSubview(mainImageView)
        mainImageView.center(inView: mainView)
        addSubview(myTitle)
        myTitle.anchor(bottom: mainView.bottomAnchor, right: mainView.rightAnchor, paddingBottom: 20, paddingRight: 20)
    }

}
