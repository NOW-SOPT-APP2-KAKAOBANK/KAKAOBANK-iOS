//
//  MyAccountCell.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/14/24.
//

import UIKit

import SnapKit
import Then

final class MyAccountCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    let accountInfoView = AccountInfoView()
    
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - Private Methods

private extension MyAccountCell {
    
    func setHierarchy() {
        self.addSubview(accountInfoView)
    }
    
    func setLayout() {
        accountInfoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
