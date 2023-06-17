//
//  CustomCellView.swift
//  MyRecipes
//
//  Created by 주환 on 2023/06/17.
//

import SDWebImage
import UIKit

class CustomCellView: UIView {
    
    private let mainView: UIView = {
       let view = UIView()
        view.frame = .init(x: 0, y: 0, width: 300, height: 300)
        view.backgroundColor = .white
        return view
    }()
    
    private let mainImageView: UIImageView = {
       let imageview = UIImageView()
//        imageview.image = UIImage(systemName: "plus")
        imageview.contentMode = .scaleAspectFill
        
//        imageview.sd_setImage(with: <#T##URL?#>)
        return imageview
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
    }

}
