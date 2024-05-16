//
//  BankListCell.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/17/24.
//

import UIKit

import SnapKit
import Then

final class BankListCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    private let logoImg: UIImageView = UIImageView()
    
    private let bankNameLabel: UILabel = UILabel()
    
    
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
    
    func bindData(data: BankBookModel) {
        logoImg.image = data.bankImg
        bankNameLabel.attributedText = UILabel.attributedText(for: .body4, withText: data.bankName)
    }
}

private extension BankListCell {
    
    func setHierarchy() {
        self.contentView.addSubviews(logoImg, bankNameLabel)
    }
    
    func setLayout() {
        logoImg.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview()
        }
        bankNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(logoImg.snp.trailing).offset(9)
        }
    }

    func setStyle() {
        logoImg.do {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
        }
        
        bankNameLabel.do {
            $0.textColor = UIColor(resource: .black0)
        }
    }
}
