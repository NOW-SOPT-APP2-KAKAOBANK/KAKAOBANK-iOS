//
//  InputAccountButton.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/14/24.
//

import UIKit

import SnapKit
import Then

protocol InputAccountButtonDelegate: AnyObject {
    func pushToSelectBankVC()
}

final class InputAccountButton: UIView {

    // MARK: - UI Properties
    
    private let inputAccountButton = UIButton()
    
    
    // MARK: - Properties
    
    weak var delegate: InputAccountButtonDelegate?
    
    
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
    
    @objc
    func didTapInputAccountButton() {
        self.delegate?.pushToSelectBankVC()
    }

}


// MARK: - Private Methods

private extension InputAccountButton {
    
    func setHierarchy() {
        self.addSubview(inputAccountButton)
    }
    
    func setLayout() {
        inputAccountButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.bottom.equalToSuperview()
        }
    }
        
    func setStyle() {
        self.backgroundColor = .white
        
        inputAccountButton.do {
            $0.backgroundColor = .white
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 9
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(resource: .gray3).cgColor
            $0.setImage(.icnPlusIos, for: .normal)
            $0.setImage(.icnPlusIos, for: .highlighted)
            $0.addTarget(self, action: #selector(didTapInputAccountButton), for: .touchUpInside)
            
            let attributedText = UILabel.attributedText(for: .body2, withText: "계좌번호 직접입력")
            $0.setAttributedTitle(attributedText, for: .normal)
            $0.setTitleColor(.gray12, for: .normal)
        }
        
    }
    
}
