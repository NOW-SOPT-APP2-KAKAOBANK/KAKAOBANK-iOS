//
//  TransferViewController.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/13/24.
//

import UIKit

final class TransferViewController: UIViewController {

    // MARK: - UI Properties

    private var rightItem = UIBarButtonItem()
    
    private let transferNaviBar = TransferNaviBar()
    
    private lazy var transferCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.makeLayout())
    
    
    // MARK: - Properties

    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNaviBar()
        setHierarchy()
        setLayout()
        setStyle()
        setDelegate()
        registerCell()
    }

}


// MARK: - Private Methods

private extension TransferViewController {
    
    func setNaviBar() {
        
        self.rightItem.customView = transferNaviBar
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    func setHierarchy() {
        
        self.view.addSubviews(transferCollectionView)
    }
    
    func setLayout() {

        transferCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    func setStyle() {

        self.view.backgroundColor = UIColor(resource: .white)
    }
    
    func setDelegate() {
        
        transferNaviBar.delegate = self
        transferCollectionView.delegate = self
        transferCollectionView.dataSource = self
    }
    
    func registerCell() {
        
        transferCollectionView.do {
            $0.register(InputCell.self, forCellWithReuseIdentifier: InputCell.cellIdentifier)
            $0.register(MyAccountCell.self, forCellWithReuseIdentifier: MyAccountCell.cellIdentifier)
            $0.register(
                SectionHeaderView.self,
                forSupplementaryViewOfKind: SectionHeaderView.elementKinds,
                withReuseIdentifier: SectionHeaderView.identifier
            )
        }
    }
    
    func makeLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { section, ev -> NSCollectionLayoutSection? in
            switch TransferSection.transferSections[section] {
            case .input:
                return self.makeInputLayout()
                
            case .myAccount:
                return self.makeAccountInfoLayout()

            }
            
        }
        
    }
    
    func makeInputLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(137 / 812))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20)
        
        let header = makeHeaderLayout()
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    func makeAccountInfoLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(42/812))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 20)
        
        let header = makeHeaderLayout()
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    func makeHeaderLayout() -> NSCollectionLayoutBoundarySupplementaryItem {
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(25))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: SectionHeaderView.elementKinds,
                                                                 alignment: .top)
        return header
        
    }
}


// MARK: - Delegates

extension TransferViewController: TransferNaviBarDelegate {
    
    func popToMainVC() {
        print("tap")
//        self.navigationController?.popViewController(animated: true)
    }
    
}

extension TransferViewController: UICollectionViewDelegate {}

extension TransferViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return TransferSection.transferSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch TransferSection.transferSections[section] {
        case .input:
            return 1
            
        case .myAccount:
            return AccountInfoModel.myAccountInfoAppData.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch TransferSection.transferSections[indexPath.section] {
        case .input:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InputCell.cellIdentifier, for: indexPath) as? InputCell else { return UICollectionViewCell() }
            return cell
            
        case .myAccount:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyAccountCell.cellIdentifier, for: indexPath) as? MyAccountCell else { return UICollectionViewCell() }
            let data = AccountInfoModel.myAccountInfoAppData[indexPath.row]
            cell.accountInfoView.bindAccountInfo(
                image: data.bankImg,
                name: data.bankbookName,
                number: data.accountNumber)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == SectionHeaderView.elementKinds {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.identifier, for: indexPath) as? SectionHeaderView else { return UICollectionReusableView() }
            
            switch TransferSection.transferSections[indexPath.section] {
            case .input:
                header.bindTitle(headerTitle: "이체", fontName: .head4)
                
            case .myAccount:
                header.bindTitle(headerTitle: "내 계좌", fontName: .subTitle1)
            }
            
            return header
        } else {
            return UICollectionReusableView()
        }
    }
    
}
