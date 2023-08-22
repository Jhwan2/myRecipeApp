//
//  GuideViewController.swift
//  MyRecipes
//
//  Created by 주환 on 2023/06/14.
//

import UIKit

final class GuideViewController: UIViewController {
    
    private let introLabel: UILabel = {
        let label = UILabel()
        label.text = "나의 레시피앱에 오신걸 환영합니다 !"
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.setTitle("Next", for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(introLabel)
        introLabel.center(inView: view)
        view.addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(handleNextBtnTapped), for: .touchUpInside)
        nextButton.anchor(top: introLabel.topAnchor, paddingTop: 50)
        nextButton.centerX(inView: view)
    }
    
    @objc func handleNextBtnTapped() {
        navigationController?.dismiss(animated: true)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
