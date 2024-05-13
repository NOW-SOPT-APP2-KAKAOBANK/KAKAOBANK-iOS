//
//  TransferNaviBar.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/13/24.
//

import UIKit

import SnapKit
import Then

protocol TransferNaviBarDelegate: AnyObject {
    func popToMainVC()
}

final class TransferNaviBar: UIView {
    
    // MARK: - UI Properties
    
    private let closeButton = UIButton()


    // MARK: - UI Properties
    
    weak var delegate: TransferNaviBarDelegate?
    
    
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func didTapCloseBtn() {
        self.delegate?.popToMainVC()
    }
    
}


// MARK: - Private Methods

private extension TransferNaviBar {
    
    func setHierarchy() {
        self.addSubview(closeButton)
    }
    
    func setLayout() {
        closeButton.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    func setStyle() {
        closeButton.do {
            let attributedText = UILabel.attributedText(for: .body6, withText: "닫기")
            $0.setAttributedTitle(attributedText, for: .normal)
            $0.setTitleColor(UIColor(resource: .black2), for: .normal)
            $0.backgroundColor = UIColor(resource: .white)
            $0.addTarget(self, action: #selector(didTapCloseBtn), for: .touchUpInside)
        }
    }
}


