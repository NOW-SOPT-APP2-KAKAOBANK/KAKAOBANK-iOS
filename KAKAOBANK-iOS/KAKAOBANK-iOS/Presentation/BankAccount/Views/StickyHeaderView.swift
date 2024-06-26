//
//  StickyHeaderView.swift
//  KAKAOBANK-iOS
//
//  Created by 김민서 on 5/15/24.
//

import UIKit

import SnapKit
import Then

protocol StickyHeaderViewDelegate: AnyObject {
    func didTapPreviousMonthButton()
    func didTapNextMonthButton()
}

final class StickyHeaderView: UIView {
    
    // MARK: - UI Properties

    private let searchButton = UIButton()

    private let previousButton = UIButton()

    private let nextButton = UIButton()

    let dateLabel = UILabel()

    private let filterButton = UIButton()

    let monthlyTotalLabel = UILabel()

    let totalAmountLabel = UILabel()

    private let graylineLabel = UILabel()
    
    
    // MARK: - Properties

    weak var delegate: StickyHeaderViewDelegate?
    
    
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

private extension StickyHeaderView {
    
    func setHierarchy() {
        self.addSubviews(searchButton, previousButton, nextButton, dateLabel, filterButton, monthlyTotalLabel, totalAmountLabel, graylineLabel)
    }
    
    func setLayout() {
        searchButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(8)
            $0.width.equalTo(44)
            $0.height.equalTo(44)
        }
        
        previousButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(17)
            $0.trailing.equalTo(dateLabel.snp.leading).offset(-12)
            $0.width.equalTo(44)
            $0.height.equalTo(44)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(29)
            $0.centerX.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(17)
            $0.leading.equalTo(dateLabel.snp.trailing).offset(12)
            $0.width.equalTo(44)
            $0.height.equalTo(44)
        }
        
        filterButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(17)
            $0.trailing.equalToSuperview().inset(6)
            $0.width.equalTo(44)
            $0.height.equalTo(44)
        }
        
        monthlyTotalLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(102)
            $0.leading.equalToSuperview().inset(20)
        }
        
        totalAmountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(102)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        graylineLabel.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    func setStyle() {
        searchButton.do {
            $0.setImage(UIImage(resource: .btnGraySearchpreIos), for: .normal)
        }
        
        previousButton.do {
            $0.setImage(UIImage(resource: .btnBackleadingGrayIos), for: .normal)
            $0.isUserInteractionEnabled = true
            $0.addTarget(self, action: #selector(previousMonthButtonTapped), for: .touchUpInside)
        }
        
        nextButton.do {
            $0.setImage(UIImage(resource: .btnFrontleadingGrayIos), for: .normal)
            $0.addTarget(self, action: #selector(nextMonthButtonTapped), for: .touchUpInside)
        }
        
        dateLabel.do {
            $0.attributedText = UILabel.attributedText(for: .head7, withText: "2024 3월")
            $0.textColor = UIColor(resource: .gray11)
        }
        
        filterButton.do {
            $0.setImage(UIImage(resource: .btnFilterIos), for: .normal)
        }
        
        monthlyTotalLabel.do {
            $0.attributedText = UILabel.attributedText(for: .head6, withText: "3월 전체")
            $0.textColor = UIColor(resource: .gray11)
        }
        
        totalAmountLabel.do {
            $0.attributedText = UILabel.attributedText(for: .head6, withText: "-150,000원")
            $0.textColor = UIColor(resource: .black2)
        }
        
        graylineLabel.do {
            $0.backgroundColor = UIColor(resource: .gray4)
        }
    }
    
    @objc
    func previousMonthButtonTapped() {
        delegate?.didTapPreviousMonthButton()
    }
    
    @objc
    func nextMonthButtonTapped() {
        delegate?.didTapNextMonthButton()
    }
}
