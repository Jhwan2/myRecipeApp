//
//  CookingCellTableViewCell.swift
//  MyRecipes
//
//  Created by 주환 on 2023/07/03.
//

import UIKit

final class CookingCell: UITableViewCell {
    
    var step: Step? {
        didSet {
//            configureUI()
            configureStep()
        }
    }
    
    private lazy var mainView: UIView = {
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
    
    private lazy var mainImageView: UIImageView = {
       let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.frame = .init()
        imageview.layer.cornerRadius = 10
        imageview.clipsToBounds = true
        imageview.anchor(width: 150, height: 150)
        return imageview
    }()
    
    private lazy var myTitle: UILabel = {
       let label = UILabel()
        label.textColor = .black
//        label.font = .systemFont(ofSize: 10)
        label.anchor(width: 200)
        label.numberOfLines = 30
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
    
    func configureUI() {
        addSubview(mainView)
        mainView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        addSubview(mainImageView)
        mainImageView.centerY(inView: mainView)
        mainImageView.anchor(top: mainView.topAnchor,left: mainView.leftAnchor,paddingTop: 0,paddingLeft: 0)
        addSubview(myTitle)
        myTitle.centerY(inView: mainView)
        myTitle.anchor(left: mainImageView.rightAnchor, paddingLeft: 20)
    }
    
    func configureStep() {
        guard let step = step else { return }
        let viewModel = CookingCellViewModel(step: step)
        
        mainImageView.sd_setImage(with: viewModel.imageUrl)
        myTitle.text = viewModel.instruction
    }

}
