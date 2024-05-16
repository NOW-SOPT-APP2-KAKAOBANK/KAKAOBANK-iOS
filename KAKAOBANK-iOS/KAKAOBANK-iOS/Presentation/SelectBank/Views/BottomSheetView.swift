//
//  BottomSheetView.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/16/24.
//

import UIKit

import SnapKit
import Then

final class BottomSheetView: UIView {
    
    // MARK: - UI Properties
    
    private let cancelButton = UIButton()
    
    let selectBankHeader = SelectBankHeaderView()
    
    let selectBankPagerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    // MARK: - Properties
    
    var selectedTab: Int = 0 {
        didSet {
            selectBankPagerCollectionView.reloadData()
        }
    }
    
    private let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
        setDelegate()
        registerCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - Private Methods

private extension BottomSheetView {
    
    func setHierarchy() {
        self.addSubviews(cancelButton, selectBankHeader, selectBankPagerCollectionView)
        self.bringSubviewToFront(cancelButton)
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
        
        selectBankPagerCollectionView.snp.makeConstraints {
            $0.top.equalTo(selectBankHeader.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
    }
    
    func setStyle() {
        cancelButton.do {
            $0.backgroundColor = UIColor(resource: .white)
            $0.setTitleColor(UIColor(resource: .black2), for: .normal)
            $0.setTitleColor(UIColor(resource: .black2), for: .highlighted)
            $0.setAttributedTitle(UILabel.attributedText(for: .body2, withText: "취소"), for: .normal)
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        selectBankPagerCollectionView.do {
            $0.collectionViewLayout = layout
            $0.isPagingEnabled = true
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    func setDelegate() {
        selectBankPagerCollectionView.delegate = self
        selectBankPagerCollectionView.dataSource = self
    }
    
    func registerCell() {
        selectBankPagerCollectionView.register(SelectBankPagerCell.self, forCellWithReuseIdentifier: SelectBankPagerCell.cellIdentifier)
    }
    
}


// MARK: - UICollectionView Delegates

extension BottomSheetView: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = selectBankPagerCollectionView.frame.size.width
        let currentPage = selectBankPagerCollectionView.contentOffset.x / pageWidth
        if currentPage < 0.5 {
            self.selectedTab = 0
            selectBankHeader.segmentView.selectedSegmentIndex = 0
        } else {
            self.selectedTab = 1
            selectBankHeader.segmentView.selectedSegmentIndex = 1
        }
    }
    
}

extension BottomSheetView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: selectBankPagerCollectionView.frame.width, height: selectBankPagerCollectionView.frame.height)
    }
    
}

extension BottomSheetView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectBankPagerCell.cellIdentifier, for: indexPath) as? SelectBankPagerCell else { return UICollectionViewCell() }
        cell.selectedTab = self.selectedTab
        cell.delegate = self
        return cell
    }
    
}

// MARK: - SelectBankPagerCellDelegate

extension BottomSheetView: SelectBankPagerCellDelegate {
    
    func setStickHeader(offsetY: Double) {
        if offsetY > 20 {
            selectBankHeader.frame.origin.y = -20
        } else if offsetY <= 0 {
            selectBankHeader.frame.origin.y = 0
        } else {
            selectBankHeader.frame.origin.y = -offsetY
        }
        
        selectBankHeader.selectBankLabel.alpha = 1 - offsetY * 0.1
    }
}
