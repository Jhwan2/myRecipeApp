//
//  CustomCellView.swift
//  MyRecipes
//
//  Created by 주환 on 2023/06/17.
//

import SDWebImage
import UIKit

class CustomCellView: UICollectionViewCell {
    
    var recipe: Recipe? {
        didSet {
            configureRecipe()
        }
    }
    
    private let mainView: UIView = {
       let view = UIView()
        view.frame = .init(x: 0, y: 0, width: 300, height: 400)
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        // 그림자 색상 설정. 이 경우 검은색입니다.
        view.layer.shadowColor = UIColor.black.cgColor

        // 그림자 투명도 설정. 1.0은 완전 불투명, 0.0은 완전 투명입니다.
        view.layer.shadowOpacity = 0.5
        // 그림자 크기 설정. 원하는 값으로 설정 가능합니다.
        view.layer.shadowOffset = CGSize(width: 0, height: 2)

        // 그림자를 얼마나 퍼지게 할지 설정. 0이면 그림자는 없고, 값이 클수록 그림자는 더 많이 퍼집니다.
        view.layer.shadowRadius = 5
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        return view
    }()
    
    let mainImageView: UIImageView = {
       let imageview = UIImageView()
//        imageview.image = UIImage(systemName: "plus")
        imageview.contentMode = .scaleToFill
        
        imageview.layer.cornerRadius = 10
        imageview.clipsToBounds = true
//        imageview.sd_setImage(with: <#T##URL?#>)
        return imageview
    }()
    
    var myTitle: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    var nickName: UILabel = {
        let label = UILabel()
         label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .medium)
         label.textAlignment = .left
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
        mainImageView.anchor(top: mainView.topAnchor,left: mainView.leftAnchor,paddingTop: 0,paddingLeft: 0)
        addSubview(myTitle)
        myTitle.anchor(top: mainImageView.bottomAnchor,left: mainView.leftAnchor, right: mainView.rightAnchor,paddingTop: 10, paddingLeft: 10, paddingRight: 10)
        addSubview(nickName)
        nickName.anchor(top: myTitle.bottomAnchor, left: mainView.leftAnchor, paddingTop: 10, paddingLeft: 10)
    }
    
    func configureRecipe() {
        
    }

}
