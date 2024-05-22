//
//  BankAccountUpperView.swift
//  KAKAOBANK-iOS
//
//  Created by 김민서 on 5/17/24.
//

import UIKit

import SnapKit
import Then

protocol BankAccountUpperViewDelegate: AnyObject {
    func pushToTransferVC()
}

final class BankAccountUpperView: UIView {
    
    var accountLabel = UILabel()
    private var underlineLabel = UILabel()
    var balanceLabel = UILabel()
    private var wonLabel = UILabel()
    private var transferButton  = UIButton()
    private var takeButton = UIButton()
    
    private var balanceStackView = UIStackView()
    private var transferButtonStackView = UIStackView()
    
    weak var delegate: BankAccountUpperViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func didTapTransferButton() {
        self.delegate?.pushToTransferVC()
    }
}

private extension BankAccountUpperView {
    
    func setHierarchy() {
        self.addSubviews(accountLabel, underlineLabel,balanceStackView,transferButtonStackView)
        
        balanceStackView.addArrangedSubviews(balanceLabel, wonLabel)
        transferButtonStackView.addArrangedSubviews(transferButton, takeButton)
    }
    
    func setLayout() {
        accountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(37)
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
    }
    
    func setStyle() {
        self.backgroundColor = UIColor(resource: .main)
        
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
            $0.backgroundColor = UIColor(resource: .yellow0)
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            let attributedText = UILabel.attributedText(for: .number3, withText: "이체하기")
            $0.setAttributedTitle(attributedText, for: .normal)
            $0.setTitleColor(.black2, for: .normal)
            $0.addTarget(self, action: #selector(didTapTransferButton), for: .touchUpInside)
        }
        
        takeButton.do {
            $0.backgroundColor = UIColor(resource: .yellow0)
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            let attributedText = UILabel.attributedText(for: .number3, withText: "가져오기")
            $0.setAttributedTitle(attributedText, for: .normal)
            $0.setTitleColor(.black2, for: .normal)
        }
        
        transferButtonStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 8
        }
    }
}
