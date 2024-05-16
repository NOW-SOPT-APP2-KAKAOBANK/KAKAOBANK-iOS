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
    
    private let dimmedView = UIView()
    
    private let bottomSheetView = BottomSheetView()
    
    
    // MARK: - Properties
    
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setHierarchy()
        setLayout()
        setStyle()
        setDelegate()
    }

}

// MARK: - Private Methods

private extension SelectBankViewController {
    
    func setHierarchy() {
        self.view.addSubview(dimmedView)
        dimmedView.addSubview(bottomSheetView)
    }
    
    func setLayout() {
        dimmedView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        bottomSheetView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(123)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
    }
    
    func setStyle() {
        self.view.backgroundColor = .clear
        self.navigationController?.navigationBar.isHidden = true
        
        dimmedView.do {
            $0.layer.backgroundColor = UIColor(resource: .black1).withAlphaComponent(0.7).cgColor
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapDimmedView(sender: )))
            $0.addGestureRecognizer(gesture)
        }
        
        bottomSheetView.do {
            $0.backgroundColor = UIColor(resource: .white)
            $0.roundCorners(cornerRadius: 25, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        }
    }
    
    func setDelegate() {
        self.bottomSheetView.selectBankHeader.delegate = self
    }
    
    @objc
    func didTapDimmedView(sender: UITapGestureRecognizer) {
        guard !bottomSheetView.frame.contains(sender.location(in: view)) else {
                return
        }
        self.dismiss(animated: true)
    }
}


// MARK: - SelectBankHeader Delegate

extension SelectBankViewController: SelectBankHeaderViewDelegate {
    
    func didChangedSegment(sender: UISegmentedControl) {
        if let title = sender.titleForSegment(at: sender.selectedSegmentIndex) {
            bottomSheetView.selectedTab = title
        }
        
        let resetOffset = CGPoint(x: 0, y: -bottomSheetView.bankListCollectionView.contentInset.top)
        bottomSheetView.bankListCollectionView.setContentOffset(resetOffset, animated: true)
    }
}
