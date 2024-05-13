//
//  AccountInfoView.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/14/24.
//

import UIKit

import SnapKit
import Then

final class AccountInfoView: UIView {
    
    // MARK: - UI Properties
    
    private let bankImageView = UIImageView()
    
    private let bankbookNameLabel = UILabel()
    
    private let accountNumberLabel = UILabel()
    
    
    // MARK: - Properties
    
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindAccountInfo(image: UIImage, name: String, number: String) {
        self.bankImageView.image = image
        self.bankbookNameLabel.attributedText = UILabel.attributedText(for: .body4, withText: name)
        self.accountNumberLabel.attributedText = UILabel.attributedText(for: .body8, withText: number)
    }
    
}


// MARK: - Private Methods

private extension AccountInfoView {
    
    func setHierarchy() {
        self.addSubviews(bankImageView, bankbookNameLabel, accountNumberLabel)
    }
    
    func setLayout() {
        bankImageView.snp.makeConstraints {
            $0.centerY.leading.equalToSuperview()
            $0.size.equalTo(42)
        }
        
        bankbookNameLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalTo(bankImageView.snp.trailing).offset(14)
        }
        
        accountNumberLabel.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview()
            $0.leading.equalTo(bankImageView.snp.trailing).offset(14)
        }
        
    }
        
    func setStyle() {
        
        self.backgroundColor = .white
        
        bankImageView.do {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 21
        }
        
        bankbookNameLabel.do {
            $0.textColor = .black1
        }
        
        accountNumberLabel.do {
            $0.textColor = .gray8
        }
        
    }
    
}
