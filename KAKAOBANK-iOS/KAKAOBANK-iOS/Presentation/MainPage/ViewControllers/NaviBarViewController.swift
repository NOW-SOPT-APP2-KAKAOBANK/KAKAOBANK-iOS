//
//  NaviBarViewController.swift
//  KAKAOBANK-iOS
//
//  Created by 오서영 on 5/15/24.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        // 네비게이션 바 배경 색상 설정
        navigationBar.barTintColor = UIColor(hex: "#282A31")
        navigationBar.isTranslucent = false
        
        // 네비게이션 바 아이템 색상 설정
        navigationBar.tintColor = .white
        
        // 네비게이션 타이틀 스타일 설정
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // 왼쪽 버튼 설정
        let accountButton = UIBarButtonItem(image: UIImage(named: "btn_myaccount_and"),
                                            style: .plain,
                                            target: self,
                                            action: #selector(accountAction))
        
        // 오른쪽 버튼 설정
        let profileButton = UIBarButtonItem(image: UIImage(named: "icn_profile_ios"),
                                            style: .plain,
                                            target: self,
                                            action: #selector(profileAction))
        
        // 네비게이션 아이템 설정
        topViewController?.navigationItem.leftBarButtonItem = accountButton
        topViewController?.navigationItem.rightBarButtonItem = profileButton
    }
    
    @objc func accountAction() {
        // 계좌 버튼 액션
    }
    
    @objc func profileAction() {
        // 프로필 버튼 액션
    }
}
