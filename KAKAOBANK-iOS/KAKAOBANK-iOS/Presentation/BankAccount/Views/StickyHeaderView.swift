//
//  StickyHeaderView.swift
//  KAKAOBANK-iOS
//
//  Created by 김민서 on 5/15/24.
//

import UIKit

import SnapKit
import Then

final class StickyHeaderView: UIView {
    
    private let searchButton = UIButton()
    private let previousButton = UIButton()
    private let nextButton = UIButton()
    private let dateLabel = UILabel()
    private let filterButton = UIButton()
    private let monthlyTotalLabel = UILabel()
    private let totalAmountLabel = UILabel()
    
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

private extension StickyHeaderView {
    
    func setHierarchy() {
   
    }
    
    func setLayout() {
      
    }
    
    func setStyle() {
        previousButton.do {
            $0.setImage(UIImage(resource: .btnBackleadingIos), for: .normal)
        }
        
        nextButton.do {
            $0.setImage(UIImage(resource: .btnFrontleadingIos), for: .normal)
        }
        
        dateLabel.do {
            $0.attributedText = UILabel.attributedText(for: .head5, withText: "2024 3월")
            $0.textColor = UIColor(resource: .gray11)
        }
        
        monthlyTotalLabel.do {
            $0.attributedText = UILabel.attributedText(for: .head7, withText: "3월 전체")
            $0.textColor = UIColor(resource: .gray11)
        }
        
        totalAmountLabel.do {
            $0.attributedText = UILabel.attributedText(for: .head6, withText: "-150,000원")
            $0.textColor = UIColor(resource: .black2)
        }
   

    }
}
