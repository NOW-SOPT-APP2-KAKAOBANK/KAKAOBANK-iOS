//
//  InputCell.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/13/24.
//

import UIKit

import SnapKit
import Then

final class InputCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    private let searchField = UITextField()
    
    private let underlineView = UIView()
    
    private let buttonStackView = UIStackView()
    
    private let accountNumberBtn = UIButton()
    
    private let kakaoFriendsBtn = UIButton()
        
    private let leftView = UIView()
    
    private let searchImg = UIImageView()
    
    private let paddingView = UIView()
    
    
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
    
}


// MARK: - Private Methods

private extension InputCell {
    
    func setHierarchy() {
        
        self.addSubviews(searchField, underlineView, buttonStackView)
        buttonStackView.addArrangedSubviews(accountNumberBtn, kakaoFriendsBtn)
        leftView.addSubviews(searchImg, paddingView)
    }
    
    func setLayout() {
        
        searchField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.horizontalEdges.equalToSuperview()
        }
        
        underlineView.snp.makeConstraints {
            $0.top.equalTo(searchField.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(underlineView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        leftView.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.height.equalTo(24)
        }
        
        searchImg.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
            $0.size.equalTo(24)
        }
        
        paddingView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalTo(searchImg.snp.trailing)
            $0.width.equalTo(25)
        }
        
    }
    
    func setStyle() {
        
        searchField.do {
            $0.attributedPlaceholder = UILabel.attributedText(for: .body4, withText: "받는사람 이름 또는 계좌번호")
            $0.textColor = UIColor(resource: .gray7)

            searchImg.image = UIImage(resource: .btnSearchIos)
            $0.leftView = leftView
            $0.leftViewMode = .always
            $0.isUserInteractionEnabled = false
        }
        
        underlineView.do {
            $0.backgroundColor = UIColor(resource: .gray3)
        }
        
        buttonStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.distribution = .fillEqually
            $0.backgroundColor = UIColor(resource: .white)
        }
        
        accountNumberBtn.do {
            let attributedText = UILabel.attributedText(for: .subTitle2, withText: "계좌번호")
            $0.setAttributedTitle(attributedText, for: .normal)
            $0.setTitleColor(.black1, for: .normal)
            $0.layer.cornerRadius = 15
            $0.clipsToBounds = true
            $0.backgroundColor = .gray2
        }
        
        kakaoFriendsBtn.do {
            let attributedText = UILabel.attributedText(for: .subTitle2, withText: "카카오톡 친구")
            $0.setAttributedTitle(attributedText, for: .normal)
            $0.setTitleColor(.gray9, for: .normal)
            $0.layer.cornerRadius = 15
            $0.clipsToBounds = true
            $0.backgroundColor = .white
        }
        
    }

}
