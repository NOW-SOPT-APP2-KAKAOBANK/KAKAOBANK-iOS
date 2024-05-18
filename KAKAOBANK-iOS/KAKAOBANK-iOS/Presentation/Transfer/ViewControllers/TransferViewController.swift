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
    
    private let inputAccountButton = InputAccountButton()
    
    
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

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}


// MARK: - Private Methods

private extension TransferViewController {
    
    func setNaviBar() {
        self.navigationItem.hidesBackButton = true
        self.rightItem.customView = transferNaviBar
        self.navigationItem.rightBarButtonItem = rightItem
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func setHierarchy() {
        self.view.addSubviews(transferCollectionView, inputAccountButton)
    }
    
    func setLayout() {
        transferCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        inputAccountButton.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(57)
        }
    }
    
    func setStyle() {
        self.view.backgroundColor = UIColor(resource: .white)
    }
    
    func setDelegate() {
        transferNaviBar.delegate = self
        inputAccountButton.delegate = self
        transferCollectionView.delegate = self
        transferCollectionView.dataSource = self
    }
    
    func registerCell() {
        transferCollectionView.do {
            $0.register(InputCell.self, forCellWithReuseIdentifier: InputCell.cellIdentifier)
            $0.register(MyAccountCell.self, forCellWithReuseIdentifier: MyAccountCell.cellIdentifier)
            $0.register(RecentTransferCell.self, forCellWithReuseIdentifier: RecentTransferCell.cellIdentifier)
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
                
            case .myAccount, .recentTransfer:
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
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(62/812))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 28, leading: 20, bottom: 43, trailing: 20)
        
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
    
    func popToBankAccountVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension TransferViewController: InputAccountButtonDelegate {
    
    func pushToSelectBankVC() {
        print("tap pushToSelectBankVC")
        let selectBankVC = SelectBankViewController()
        selectBankVC.modalPresentationStyle = .overFullScreen
        self.present(selectBankVC, animated: true)
    }
    
}

extension TransferViewController: RecentTransferDelegate {
    
    func changeFavoriteButtonState(_ cell: RecentTransferCell) {
        cell.isFavorite = !cell.isFavorite
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
            
        case .recentTransfer:
            return AccountInfoModel.recentTransferInfoAppData.count
            
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
            
        case .recentTransfer:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentTransferCell.cellIdentifier, for: indexPath) as? RecentTransferCell else { return UICollectionViewCell() }
            let data = AccountInfoModel.recentTransferInfoAppData[indexPath.row]
            cell.accountInfoView.bindAccountInfo(
                image: data.bankImg,
                name: data.bankbookName,
                number: data.accountNumber)
            cell.delegate = self
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
                
            case .recentTransfer:
                header.bindTitle(headerTitle: "최근 이체", fontName: .subTitle1)
            }
            
            return header
        } else {
            return UICollectionReusableView()
        }
    }
    
}
