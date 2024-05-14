//
//  SelectBankViewController.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/14/24.
//

import UIKit

import SnapKit
import Then

final class SelectBankViewController: UIViewController {

    // MARK: - UI Properties
    
    private let cancelButton = UIButton()
    
    private let selectBankHeader = SelectBankHeaderView()
    
    
    // MARK: - Properties
    
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setHierarchy()
        setLayout()
        setStyle()
    }


}

// MARK: - Private Methods

private extension SelectBankViewController {
    
    func setHierarchy() {
        self.view.addSubviews(cancelButton, selectBankHeader)
        self.view.bringSubviewToFront(cancelButton)
    }
    
    func setLayout() {
        cancelButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.trailing.equalToSuperview().inset(9)
            $0.size.equalTo(44)
        }
        
        selectBankHeader.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(204)
        }
    }
    
    func setStyle() {
        self.view.backgroundColor = UIColor(resource: .white)
        self.navigationController?.navigationBar.isHidden = true
        
        cancelButton.do {
            $0.backgroundColor = UIColor(resource: .white)
            $0.setTitleColor(UIColor(resource: .black2), for: .normal)
            $0.setTitleColor(UIColor(resource: .black2), for: .highlighted)
            $0.setAttributedTitle(UILabel.attributedText(for: .body2, withText: "취소"), for: .normal)
        }
        
        selectBankHeader.do {
            $0.segmentView.addTarget(self, action: #selector(didChangeValue(sender: )), for: .valueChanged)
        }
    }
    
    @objc
    func didChangeValue(sender: UISegmentedControl) {
        print("change to \(sender.selectedSegmentIndex)")
    }
}
