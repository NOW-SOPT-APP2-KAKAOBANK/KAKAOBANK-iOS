//
//  BankAccountViewController.swift
//  KAKAOBANK-iOS
//
//  Created by 김민서 on 5/14/24.
//

import UIKit

final class BankAccountViewController: UIViewController {
    
    private let bankAccountNaviBar = BankAccountNaviBar()
    private let scrollView = UIScrollView()
    private var contentView = UIView()

    private var accountLabel = UILabel()
    private var balanceLabel = UILabel()
    private var wonLabel = UILabel()
    private var transferButton  = UIButton()
    private var takeButton = UIButton()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        setDelegate()
        
    }
}

private extension BankAccountViewController {
    
    func setHierarchy() {
        self.view.addSubview(scrollView)
        
        [bankAccountNaviBar, contentView].forEach {
            scrollView.addSubview($0)
        }
        [accountLabel, balanceLabel, wonLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        bankAccountNaviBar.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        accountLabel.snp.makeConstraints {
            $0.top.equalTo(bankAccountNaviBar.snp.bottom).offset(37)
            $0.centerX.equalToSuperview()
        }
        
        balanceLabel.snp.makeConstraints {
            $0.top.equalTo(accountLabel.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }
        
        wonLabel.snp.makeConstraints {
            $0.centerY.equalTo(balanceLabel)
            $0.centerX.equalToSuperview()
        }
        
        
    }
    
    func setStyle() {
        self.view.backgroundColor = UIColor(resource: .main)
        
        accountLabel.do {
            $0.attributedText = UILabel.attributedText(for: .body7, withText: "3333-17-1799152")
            $0.textColor = UIColor(resource: .yellow3)
        }
        
        balanceLabel.do {
            $0.attributedText = UILabel.attributedText(for: .head1, withText: "0")
            $0.textColor = UIColor(resource: .black2)
        }
        
        wonLabel.do {
            $0.attributedText = UILabel.attributedText(for: .head3, withText: "원")
            $0.textColor = UIColor(resource: .black2)
        }
    }
    
    func setDelegate() {
        
    }
}
