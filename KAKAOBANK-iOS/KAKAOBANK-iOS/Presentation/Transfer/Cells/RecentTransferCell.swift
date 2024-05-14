//
//  RecentTransferCell.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/14/24.
//

import UIKit

import SnapKit
import Then

protocol RecentTransferDelegate: AnyObject {
    func changeFavoriteButtonState(_ cell: RecentTransferCell)
}

final class RecentTransferCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    let accountInfoView = AccountInfoView()
    
    let favoriteButton = UIButton()
    
    
    // MARK: - Properties
    
    weak var delegate: RecentTransferDelegate?
    
    var isFavorite: Bool = false {
        didSet {
            changeButtonStyle()
        }
    }
    
    
    // MARK: - LifeCycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeButtonStyle() {
        if isFavorite {
            self.favoriteButton.setImage(.icnStarOnIos, for: .normal)
            self.favoriteButton.isSelected = true
        } else {
            self.favoriteButton.setImage(.icnStarOffIos, for: .normal)
            self.favoriteButton.isSelected = false
        }
        print(self.favoriteButton.isSelected)
    }
    
    @objc
    func didTapFavoriteButton() {
        self.delegate?.changeFavoriteButtonState(self)
    }
}


// MARK: - Private Methods

private extension RecentTransferCell {
    
    func setHierarchy() {
        self.contentView.addSubview(accountInfoView)
        accountInfoView.addSubview(favoriteButton)
    }
    
    func setLayout() {
        accountInfoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        favoriteButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(accountInfoView.bankImageView)
            $0.size.equalTo(20)
        }
    }

    func setStyle() {
        favoriteButton.do {
            $0.setImage(.icnStarOffIos, for: .normal)
            $0.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        }
    }
    
}
