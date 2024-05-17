//
//  BankListCell.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/16/24.
//

import UIKit

import SnapKit
import Then

protocol SelectBankPagerCellDelegate: AnyObject {
    func setStickHeader(offsetY: Double)
}

final class SelectBankPagerCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    private let bankListCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    // MARK: - Properties
    
    weak var delegate: SelectBankPagerCellDelegate?
    
    private let bankListData: [BankBookModel] = BankBookModel.bankBookData

    private let stockListData: [BankBookModel] = BankBookModel.stockData
        
    var selectedTab: Int = 0 {
        didSet {
            resetCollectionViewOffset(collectionView: bankListCollectionView)
        }
    }
        
    
    
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

private extension SelectBankPagerCell {
    
    func setHierarchy() {
        self.contentView.addSubview(bankListCollectionView)
    }
    
    func setLayout() {
        bankListCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func setStyle() {
        bankListCollectionView.do {
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    func setDelegate() {
        bankListCollectionView.delegate = self
        bankListCollectionView.dataSource = self
    }
    
    func registerCell() {
        bankListCollectionView.register(BankListCell.self, forCellWithReuseIdentifier: BankListCell.cellIdentifier)
    }
    
    func resetCollectionViewOffset(collectionView: UICollectionView) {
        let resetOffset = CGPoint(x: 0, y: -collectionView.contentInset.top)
        collectionView.setContentOffset(resetOffset, animated: false)
        collectionView.reloadData()
    }
    
}


// MARK: - UICollectionView Delegate

extension SelectBankPagerCell: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        self.delegate?.setStickHeader(offsetY: offsetY)
    }
}

extension SelectBankPagerCell: UICollectionViewDelegateFlowLayout {
    
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

extension SelectBankPagerCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch selectedTab {
        case 0:
            return bankListData.count
        case 1:
            return stockListData.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BankListCell.cellIdentifier, for: indexPath) as? BankListCell else { return UICollectionViewCell() }
        
        switch selectedTab {
        case 0:
            cell.bindData(data: bankListData[indexPath.row])
        case 1:
            cell.bindData(data: stockListData[indexPath.row])
        default:
            return cell
        }
        return cell
    }
    
}
