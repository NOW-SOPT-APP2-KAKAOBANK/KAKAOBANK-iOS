//
//  BankListView.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/14/24.
//

import UIKit

import SnapKit
import Then

final class SelectBankHeaderView: UIView {

    // MARK: - UI Properties
    
    private let selectBankLabel = UILabel()
    
    private let searchField = UITextField()
    
    private let searchImg = UIImageView()
    
    private let leftView = UIView()
    
    private let paddingView = UIView()
    
    let segmentView = SegmentView(items: ["은행", "증권"])

    
    // MARK: - Properties
    
    let screenWidth = UIScreen.main.bounds.width
    
    
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
    
}


// MARK: - Private Methods

private extension SelectBankHeaderView {
    
    func setHierarchy() {
        self.addSubviews(selectBankLabel, searchField, segmentView)
        searchField.addSubviews(searchImg, paddingView)
    }
    
    func setLayout() {
        selectBankLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(49)
            $0.leading.equalToSuperview().inset(22)
        }
        
        searchField.snp.makeConstraints {
            $0.top.equalTo(selectBankLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(57)
        }
        
        leftView.snp.makeConstraints {
            $0.width.equalTo(55)
            $0.height.equalTo(18)
        }
        
        searchImg.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(28)
            $0.size.equalTo(14)
        }
        
        paddingView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalTo(searchImg.snp.trailing)
            $0.width.equalTo(13)
        }
        
        segmentView.snp.makeConstraints {
            $0.top.equalTo(searchField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(53)
        }
    }
    
    func setStyle() {
        self.backgroundColor = UIColor(resource: .white)
        
        selectBankLabel.do {
            $0.textColor = UIColor(resource: .black2)
            $0.attributedText = UILabel.attributedText(for: .head4, withText: "은행선택")
        }
        
        searchField.do {
            $0.backgroundColor = UIColor(resource: .gray0)
            $0.layer.cornerRadius = 9
            $0.attributedPlaceholder = UILabel.attributedText(for: .body2, withText: "은행검색")
            $0.textColor = UIColor(resource: .gray5)

            searchImg.image = UIImage(resource: .btnSearchpreIos)
            $0.leftView = leftView
            $0.leftViewMode = .always
            $0.isUserInteractionEnabled = false
        }
        
        paddingView.do {
            $0.backgroundColor = UIColor(resource: .gray0)
        }
        
        segmentView.do {
            $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(resource: .gray7), .font: UIFont.pretendard(.body2)], for: .normal)
            $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(resource: .darkgray1), .font: UIFont.pretendard(.body2)], for: .selected)
            $0.apportionsSegmentWidthsByContent = true
            $0.selectedSegmentIndex = 0
            $0.backgroundColor = UIColor(resource: .white)
            $0.setWidth((screenWidth - 32) / 2, forSegmentAt: 0)
            $0.setWidth((screenWidth - 32) / 2, forSegmentAt: 1)
        }
    }
    
}
