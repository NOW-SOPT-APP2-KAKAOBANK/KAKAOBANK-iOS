//
//  BankAccountTableViewCell.swift
//  KAKAOBANK-iOS
//
//  Created by 김민서 on 5/15/24.
//

import UIKit

import SnapKit
import Then

class BankAccountTableViewCell: UITableViewCell {
    
    static let identifier = "BankAccountTableViewCell"
    
    private let dateLabel = UILabel()
    private let transactionLabel = UILabel()
    private let tagLabel = UILabel()
    private let transactionAmountLabel = UILabel()
    private let totalAmountLabel = UILabel()
    private let graylineLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension BankAccountTableViewCell {
    private func setHierarchy() {
        contentView.addSubviews(dateLabel, transactionLabel, tagLabel, transactionAmountLabel, totalAmountLabel, graylineLabel)
    }
    
    private func setLayout() {
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25.5)
            $0.leading.equalToSuperview().inset(15)
        }
        
        transactionLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel)
            $0.leading.equalTo(dateLabel.snp.trailing).offset(15)
        }
        
        tagLabel.snp.makeConstraints {
            $0.top.equalTo(transactionLabel.snp.bottom).offset(5)
            $0.leading.equalTo(transactionLabel)
        }
        
        transactionAmountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        totalAmountLabel.snp.makeConstraints {
            $0.top.equalTo(transactionAmountLabel.snp.bottom).offset(3)
            $0.trailing.equalTo(transactionAmountLabel)
        }
        
        graylineLabel.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
    }
    
    private func setStyle() {
        dateLabel.do {
            $0.attributedText = UILabel.attributedText(for: .number3, withText: "03.23")
            $0.textColor = UIColor(resource: .gray11)
        }
        
        transactionLabel.do {
            $0.attributedText = UILabel.attributedText(for: .body4, withText: "입출금 통장 이자")
            $0.textColor = UIColor(resource: .black2)
        }
        
        tagLabel.do {
            $0.attributedText = UILabel.attributedText(for: .number2, withText: "#예금이자")
            $0.textColor = UIColor(resource: .deepblue0)
        }
        
        transactionAmountLabel.do {
            $0.attributedText = UILabel.attributedText(for: .head5, withText: "0원")
            $0.textColor = UIColor(resource: .deepblue0)
        }
        
        totalAmountLabel.do {
            $0.attributedText = UILabel.attributedText(for: .number3, withText: "0원")
            $0.textColor = UIColor(resource: .gray10)
        }
        
        graylineLabel.do {
            $0.backgroundColor = UIColor(resource: .gray4)
        }
    }
}

extension BankAccountTableViewCell {
    func dataBind(_ data: BankAccountModel) {
        dateLabel.text = data.dateLabel
        transactionLabel.text = data.transactionLabel
        tagLabel.text = data.tagLabel
        transactionAmountLabel.text = data.transactionAmountLabel
        totalAmountLabel.text = data.totalAmountLabel

        if let firstChar = data.transactionAmountLabel.first {
            setTextColor(for: firstChar)
        }
    }
    
    private func setTextColor(for firstCharacter: Character) {
        if firstCharacter == "-" {
            transactionAmountLabel.textColor = UIColor(resource: .black2) // 파란색으로 변경
        }
    }
}

