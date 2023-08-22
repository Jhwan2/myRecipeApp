//
//  Test.swift
//  SixTech
//
//  Created by 주환 on 2023/07/13.
//

import GameKit
import UIKit
import SwiftUI

protocol CustomMatchmakerViewControllerDelegate: AnyObject {
    func customMatchmakerViewController(_ viewController: CustomMatchmakerViewController, didFind match: GKMatch)
    func customMatchmakerViewController(_ viewController: CustomMatchmakerViewController, didFailWithError error: Error)
    func customMatchmakerViewControllerWasCancelled(_ viewController: CustomMatchmakerViewController)
}

class CustomMatchmakerViewController: UIViewController {
    
    weak var delegate: CustomMatchmakerViewControllerDelegate?
    
    private let matchRequest: GKMatchRequest
    private let matchmakingMode: GKMatchmakingMode
    private var matchmaker: GKMatchmaker?
    
    // 현재 진행 중인 그룹 정보를 저장할 변수
    var currentGroup: Int = 0
    
    var joinCode: String?
    
    init(matchRequest: GKMatchRequest, matchmakingMode: GKMatchmakingMode) {
        self.matchRequest = matchRequest
        self.matchmakingMode = matchmakingMode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
        // 현재 그룹 정보를 보여줄 레이블 생성
        let groupLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 50))
        groupLabel.textAlignment = .center
        groupLabel.font = UIFont.boldSystemFont(ofSize: 16)
        groupLabel.text = "Current Group: \(currentGroup)"
        view.addSubview(groupLabel)
        
        // 매칭 버튼 생성
        let matchButton = UIButton(type: .system)
        matchButton.setTitle("Start Matching", for: .normal)
        matchButton.addTarget(self, action: #selector(startMatchmaking), for: .touchUpInside)
        matchButton.frame = CGRect(x: 50, y: 100, width: view.bounds.width - 100, height: 50)
        view.addSubview(matchButton)
    }
    
    @objc private func startMatchmaking() {
        matchmaker = GKMatchmaker.shared()
        matchmaker?.findMatch(for: matchRequest, withCompletionHandler: { [weak self] (match, error) in
            if let error = error {
                self?.delegate?.customMatchmakerViewController(self!, didFailWithError: error)
            } else if let match = match {
                self?.delegate?.customMatchmakerViewController(self!, didFind: match)
            }
        })
    }
    
    func cancelMatchmaking() {
        matchmaker?.cancel()
        delegate?.customMatchmakerViewControllerWasCancelled(self)
    }
    
    // 이후 매칭 관련 로직을 추가해야합니다.
    // 예를 들면 매칭 성공 시 매치 메서드를 구현하고, 플레이어 연결 상태 변경 등의 델리게이트 메서드를 처리해야합니다.
}
