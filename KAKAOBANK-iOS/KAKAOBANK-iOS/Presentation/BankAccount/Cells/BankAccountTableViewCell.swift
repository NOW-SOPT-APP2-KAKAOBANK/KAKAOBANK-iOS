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
    private let transactionAmountLabel = UILabel()
    private let totalAmountLabel = UILabel()
    
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
        [dateLabel, transactionLabel, transactionAmountLabel, totalAmountLabel].forEach {
            contentView.addSubview($0)
        }
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
        
        transactionAmountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        totalAmountLabel.snp.makeConstraints {
            $0.top.equalTo(transactionAmountLabel.snp.bottom).offset(3)
            $0.trailing.equalTo(transactionAmountLabel)
            //$0.bottom.equalToSuperview().offset(-24)
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
        
        transactionAmountLabel.do {
            $0.attributedText = UILabel.attributedText(for: .head5, withText: "0원")
            $0.textColor = UIColor(resource: .deepblue0)
        }
        
        totalAmountLabel.do {
            $0.attributedText = UILabel.attributedText(for: .number3, withText: "0원")
            $0.textColor = UIColor(resource: .gray10)
        }
    }
}

extension BankAccountTableViewCell {
    func dataBind(_ data: BankAccountModel) {
        dateLabel.text = data.dateLabel
        transactionLabel.text = data.transactionLabel
        transactionAmountLabel.text = data.transactionAmountLabel
        totalAmountLabel.text = data.totalAmountLabel
    }
}
