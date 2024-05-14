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
    
    private let bankAccountTableView = UITableView()
    private let stickyHeaderView = StickyHeaderView()
    
    private var accountLabel = UILabel()
    private var underlineLabel = UILabel()
    private var balanceLabel = UILabel()
    private var wonLabel = UILabel()
    private var transferButton  = UIButton()
    private var takeButton = UIButton()
    
    private var balanceStackView = UIStackView()
    private var transferButtonStackView = UIStackView()
    
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
        self.view.addSubviews(bankAccountNaviBar,scrollView)
        
        self.scrollView.addSubviews(contentView)
        self.contentView.addSubviews(accountLabel, underlineLabel, balanceStackView, transferButtonStackView, bankAccountTableView)
    
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(wonLabel)
        
        transferButtonStackView.addArrangedSubview(transferButton)
        transferButtonStackView.addArrangedSubview(takeButton)
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
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(88)
        }
        
        accountLabel.snp.makeConstraints {
            $0.top.equalTo(bankAccountNaviBar.snp.bottom).offset(37)
            $0.centerX.equalToSuperview()
        }
        underlineLabel.snp.makeConstraints {
            $0.top.equalTo(accountLabel.snp.bottom).offset(1)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(accountLabel)
            $0.height.equalTo(1)
        }
        
        balanceStackView.snp.makeConstraints {
            $0.top.equalTo(accountLabel.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }
        
        transferButton.snp.makeConstraints {
            $0.width.equalTo(145)
            $0.height.equalTo(50)
        }
        
        takeButton.snp.makeConstraints {
            $0.width.equalTo(145)
            $0.height.equalTo(50)
        }
        
        transferButtonStackView.snp.makeConstraints {
            $0.top.equalTo(balanceStackView.snp.bottom).offset(47)
            $0.centerX.equalToSuperview()
        }
        
        //테이블 뷰 레이아웃 잡아주기
        bankAccountTableView.snp.makeConstraints {
            $0.top.equalTo(transferButtonStackView.snp.bottom).offset(24)
        }
        
    }
    
    func setStyle() {
        self.view.backgroundColor = UIColor(resource: .main)
        
        accountLabel.do {
            $0.attributedText = UILabel.attributedText(for: .body7, withText: "3333-17-1799152")
            $0.textColor = UIColor(resource: .yellow3)
        }
        
        underlineLabel.do {
            $0.backgroundColor = UIColor(resource: .yellow1)
        }
        
        balanceLabel.do {
            $0.attributedText = UILabel.attributedText(for: .head1, withText: "0")
            $0.textColor = UIColor(resource: .black2)
        }
        
        wonLabel.do {
            $0.attributedText = UILabel.attributedText(for: .head3, withText: "원")
            $0.textColor = UIColor(resource: .black2)
        }
        
        balanceStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 0
        }
        
        transferButton.do {
            $0.backgroundColor = .yellow0
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            let attributedText = UILabel.attributedText(for: .number2, withText: "이체하기")
            $0.setAttributedTitle(attributedText, for: .normal)
            $0.setTitleColor(.black2, for: .normal)
        }
        
        takeButton.do {
            $0.backgroundColor = .yellow0
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            let attributedText = UILabel.attributedText(for: .number2, withText: "가져오기")
            $0.setAttributedTitle(attributedText, for: .normal)
            $0.setTitleColor(.black2, for: .normal)
        }
        
        transferButtonStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 8
        }

    }
    
    func setDelegate() {
    }
    
}


