//
//  AccountInfoView.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/14/24.
//

import UIKit

import Kingfisher
import SnapKit
import Then

final class AccountInfoView: UIView {
    
    // MARK: - UI Properties
    
    let bankImageView = UIImageView()
    
    private let labelStackView = UIStackView()
    
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
    
    func bindAccountInfo(data: AccountInfoModel) {
        if let url = URL(string: data.imgURL) {
            self.bankImageView.kf.setImage(with: url)
        } else {
            self.bankImageView.image = UIImage(resource: .btnKakaoBankIos)
        }
        self.bankbookNameLabel.attributedText = UILabel.attributedText(for: .body4, withText: data.accountName)
        self.accountNumberLabel.attributedText = UILabel.attributedText(for: .body8, withText: "\(data.bankName) \(data.accountNumber)")
    }
    
}


// MARK: - Private Methods

private extension AccountInfoView {
    
    func setHierarchy() {
        self.addSubviews(bankImageView, labelStackView)
        labelStackView.addArrangedSubviews(bankbookNameLabel, accountNumberLabel)
    }
    
    func setLayout() {
        bankImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.size.equalTo(42)
        }
        
        labelStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.height.equalTo(42)
            $0.centerY.equalTo(bankImageView)
            $0.leading.equalTo(bankImageView.snp.trailing).offset(14)
        }
        
    }
        
    func setStyle() {
        self.backgroundColor = .white
        
        bankImageView.do {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 21
            $0.contentMode = .scaleAspectFit
        }
        
        labelStackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
            $0.distribution = .fill
        }
        
        bankbookNameLabel.do {
            $0.textColor = .black1
        }
        
        accountNumberLabel.do {
            $0.textColor = .gray8
        }
        
    }
    
}
