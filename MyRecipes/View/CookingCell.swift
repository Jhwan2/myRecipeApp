//
//  CookingCellTableViewCell.swift
//  MyRecipes
//
//  Created by 주환 on 2023/07/03.
//

import UIKit

class CookingCell: UITableViewCell {
    private let mainView: UIView = {
       let view = UIView()
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
        imageview.contentMode = .scaleToFill
        imageview.frame = .init()
        imageview.layer.cornerRadius = 10
        imageview.clipsToBounds = true
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
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureUI() {
        addSubview(mainView)
        addSubview(mainImageView)
        mainImageView.anchor(top: mainView.topAnchor,left: mainView.leftAnchor,paddingTop: 0,paddingLeft: 0)
        addSubview(myTitle)
        myTitle.anchor(top: mainImageView.bottomAnchor,left: mainView.leftAnchor, right: mainView.rightAnchor,paddingTop: 10, paddingLeft: 10, paddingRight: 10)
    }

}