//
//  BankAccountNaviBar.swift
//  KAKAOBANK-iOS
//
//  Created by 김민서 on 5/14/24.
//

import UIKit

import SnapKit
import Then

final class BankAccountNaviBar: UIView {
    
    private let backButton = UIButton()
    private let titleLabel = UILabel()
    private let settingButton = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
        setBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension BankAccountNaviBar {
    
    func setHierarchy() {
        [backButton,titleLabel,settingButton].forEach {
            self.addSubview($0)
        }
    }
    
    func setLayout() {
        backButton.do {
            $0.setImage(UIImage(resource: .btnBackleadingIos), for: .normal)
        }
        titleLabel.do {
            $0.attributedText = UILabel.attributedText(for: .head5, withText: "햄들의 통장")
            $0.textColor = UIColor(resource: .black2)
        }
        settingButton.do {
            $0.setImage(UIImage(resource: .btnSettingIos), for: .normal)
        }
    }
    
    func setStyle() {
        self.backgroundColor = UIColor(resource: .main)
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(44)
            $0.leading.equalToSuperview().inset(2)
            $0.height.width.equalTo(44)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(56)
            $0.centerX.equalToSuperview()
        }
        settingButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(44)
            $0.trailing.equalToSuperview().inset(8)
            $0.height.width.equalTo(44)
        }
    }
    
    func setBackgroundColor() {
        self.backgroundColor = UIColor(resource: .main)
    }
}
