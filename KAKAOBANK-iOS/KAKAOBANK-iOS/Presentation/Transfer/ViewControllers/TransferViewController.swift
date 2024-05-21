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
    
    private var recentTransferData: [AccountInfoModel] = [] {
        didSet {
            self.transferCollectionView.reloadData()
        }
    }
    
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
        getRecentTransferList()
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
    
    func getRecentTransferList() {
        self.recentTransferData.removeAll()
        NetworkService.shared.transferService.getRecentTransfer(accountId: 1) { result in
            switch result {
            case .success(let data):
                for i in data {
                    self.recentTransferData.append(AccountInfoModel(accountName: i.accountName,
                                                                    accountNumber: i.accountNumber,
                                                                    isAccountLike: i.isAccountLike,
                                                                    bankName: i.bankName,
                                                                    imgURL: i.imgURL,
                                                                    accountID: i.accountID))
                }
            default:
                print("에러입니다")
            }
        }
    }
    
    func postBookmarkState(markedButtonId: Int, cell: RecentTransferCell) {
        NetworkService.shared.bookmarkService.postBookmarkState(myAccountId: 1, markedAccountId: markedButtonId) { result in
            switch result {
            case 200:
                cell.isFavorite = !cell.isFavorite
            default:
                print("에러입니다")
            }
        }
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
        let selectBankVC = SelectBankViewController()
        selectBankVC.modalPresentationStyle = .overFullScreen
        self.present(selectBankVC, animated: true)
    }
    
}

extension TransferViewController: RecentTransferDelegate {
    
    func changeFavoriteButtonState(_ cell: RecentTransferCell, markedButtonId: Int) {
        if !cell.isFavorite {
            self.postBookmarkState(markedButtonId: markedButtonId, cell: cell)
        } else {
            // 즐겨찾기 해제 서버 통신
        }
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
            return recentTransferData.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch TransferSection.transferSections[indexPath.section] {
        case .input:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InputCell.cellIdentifier, for: indexPath) as? InputCell else { return UICollectionViewCell() }
            return cell
            
        case .myAccount:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyAccountCell.cellIdentifier, for: indexPath) as? MyAccountCell else { return UICollectionViewCell() }
            cell.accountInfoView.bindAccountInfo(data: AccountInfoModel.myAccountInfoAppData[indexPath.row])
            return cell
            
        case .recentTransfer:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentTransferCell.cellIdentifier, for: indexPath) as? RecentTransferCell else { return UICollectionViewCell() }
            cell.accountInfoView.bindAccountInfo(data: recentTransferData[indexPath.row])
            cell.isFavorite = recentTransferData[indexPath.row].isAccountLike
            cell.markedButtonId = recentTransferData[indexPath.row].accountID
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
