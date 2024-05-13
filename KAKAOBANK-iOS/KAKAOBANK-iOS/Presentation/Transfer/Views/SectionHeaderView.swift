//
//  SectionHeaderView.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/13/24.
//

import UIKit

import SnapKit
import Then

class SectionHeaderView: UICollectionReusableView {
    
    // MARK: - UI Properties
    
    let titleLabel: UILabel = UILabel()
        
    
    // MARK: - Properties
    
    static let elementKinds: String = "header"

    static let identifier: String = "SectionHeaderView"

    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindTitle(headerTitle: String, fontName: FontName) {
        self.titleLabel.do {
            $0.attributedText = UILabel.attributedText(for: fontName, withText: headerTitle)
            $0.textColor = UIColor(resource: .black1)
        }
    }
    
}


// MARK: - Private Methods

private extension SectionHeaderView {
    
    func setHierarchy() {
        
        self.addSubview(titleLabel)
        
    }
    
    func setLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
    }
    
}
