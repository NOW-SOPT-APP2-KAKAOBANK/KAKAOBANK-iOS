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
    
    let bankListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    // MARK: - Properties
    
    var selectedTab: String = "은행" {
        didSet {
            bankListCollectionView.reloadData()
        }
    }
    
    private let bankListData: [BankBookModel] = BankBookModel.bankBookData

    private let stockListData: [BankBookModel] = BankBookModel.stockData
    
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

private extension BottomSheetView {
    
    func setHierarchy() {
        self.addSubviews(cancelButton, selectBankHeader, bankListCollectionView)
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
        
        bankListCollectionView.snp.makeConstraints {
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
    }
    
    func setDelegate() {
        bankListCollectionView.delegate = self
        bankListCollectionView.dataSource = self
    }
    
    func registerCell() {
        bankListCollectionView.register(BankListCell.self, forCellWithReuseIdentifier: BankListCell.cellIdentifier)
    }
    
}


// MARK: - UICollectionView Delegates

extension BottomSheetView: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y

        if offsetY > 20 {
            selectBankHeader.frame.origin.y = -20
        } else if offsetY <= 0 {
            selectBankHeader.frame.origin.y = 0 
        } else {
            selectBankHeader.frame.origin.y = -offsetY
        }
        
        selectBankHeader.selectBankLabel.alpha = 1 - offsetY * 0.1
        print(selectBankHeader.selectBankLabel.alpha)
    }
}

extension BottomSheetView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (bankListCollectionView.frame.width - 58) / 2, height: 21)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 29
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 42, left: 29, bottom: 0, right: 29)
    }

}

extension BottomSheetView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch selectedTab {
        case "은행":
            bankListData.count
        case "증권":
            stockListData.count
        default:
            0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BankListCell.cellIdentifier, for: indexPath) as? BankListCell else { return UICollectionViewCell() }
        
        switch selectedTab {
        case "은행":
            cell.bindData(data: bankListData[indexPath.row])
        case "증권":
            cell.bindData(data: stockListData[indexPath.row])
        default:
            return cell
        }
        return cell
    }
    
}
