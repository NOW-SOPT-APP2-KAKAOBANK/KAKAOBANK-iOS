//
//  BankAccountViewController.swift
//  KAKAOBANK-iOS
//
//  Created by 김민서 on 5/14/24.
//

import UIKit

import SnapKit
import Then

struct AccountData {
    var accountName: String
    var balance: Int
    var accountNumber: String
}



final class BankAccountViewController: UIViewController {
    
    private let bankAccountNaviBar = BankAccountNaviBar()
    private var bankAccountUpperView = BankAccountUpperView()
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private let bankAccountTableView = UITableView()
    private let stickyHeaderView = StickyHeaderView()
    private let headerView = StickyHeaderView()
    
    private let backgroundView = UIView()

    
    private let bankAccountList = BankAccountModel.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        setDelegate()
        register()
        getMyAccount()
        configureRefreshControl()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        bankAccountTableView.reloadData()
        
        let conetentHeight = CGFloat(bankAccountList.count) * 87
        self.bankAccountTableView.snp.remakeConstraints {
            $0.top.equalTo(self.stickyHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.contentView)
            $0.height.equalTo(conetentHeight)
        }
        bankAccountTableView.layoutIfNeeded()
    }
    
}

private extension BankAccountViewController {
  
    func getMyAccount() {
        MyAccountService.shared.getMyAccount(accountId: 1) { result in
            switch result {
            case .success(let data):
                let formattedAccount = self.formatAccount("\(data.accountNumber)")
                
                self.bankAccountNaviBar.titleLabel.text = data.accountName
                self.bankAccountUpperView.balanceLabel.text = "\(data.balance)"
                self.bankAccountUpperView.accountLabel.text = formattedAccount
                
            case .requestErr:
                print("요청 오류입니다")
            case .decodedErr:
                print("디코딩 오류입니다")
            case .pathErr:
                print("경로 오류입니다")
            case .serverErr:
                print("서버 오류입니다")
            case .networkFail:
                print("네트워크 오류입니다")
            }
        }
    }

    //계좌번호 사이 - 추가를 위한 메서드
    func formatAccount(_ accountNumber: String) -> String {
        var formattedAccount = ""
        for (index, char) in accountNumber.enumerated() {
            if index == 4 || index == 6 {
                formattedAccount.append("-")
            }
            formattedAccount.append(char)
        }
        return formattedAccount
    }

    
    func setHierarchy() {
        self.view.addSubviews(backgroundView,scrollView,bankAccountNaviBar, headerView)
        
        scrollView.addSubview(contentView)
        self.contentView.addSubviews(bankAccountUpperView, bankAccountTableView, stickyHeaderView)
    }
    
    func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(bankAccountNaviBar.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualTo(bankAccountTableView.contentSize.height)
            
        }
        
        bankAccountNaviBar.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(88)
        }
        
        bankAccountUpperView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(229)
        }
        
        //스티키 헤더 뷰
        stickyHeaderView.snp.makeConstraints {
            $0.top.equalTo(bankAccountUpperView.snp.bottom)
            $0.leading.trailing.equalTo(scrollView)
            $0.height.equalTo(163)
        }
        
        headerView.snp.makeConstraints {
            $0.top.equalTo(bankAccountNaviBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(163)
        }
        
        backgroundView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
        
    }
    
    func setStyle() {
        self.view.backgroundColor = UIColor(resource: .main)
        self.navigationController?.isNavigationBarHidden = true
        bankAccountTableView.isScrollEnabled = true
        
        backgroundView.backgroundColor = .white
        
        stickyHeaderView.do {
            $0.backgroundColor = .white
        }
        
        bankAccountTableView.do {
            $0.isScrollEnabled = false
            $0.separatorStyle = .none
        }
        
        headerView.do {
            $0.backgroundColor = .white
            $0.isHidden = true
        }
        
        
    }
    
    func setDelegate() {
        bankAccountNaviBar.delegate = self
        bankAccountUpperView.delegate = self
        bankAccountTableView.delegate = self
        bankAccountTableView.dataSource = self
        scrollView.delegate = self
    }
    
    private func register() {
        bankAccountTableView.register(
            BankAccountTableViewCell.self,
            forCellReuseIdentifier: BankAccountTableViewCell.identifier
        )
    }
    
    //Pull to Refresh 새로 고침 구현
    func configureRefreshControl() {
        scrollView.refreshControl = UIRefreshControl()
        scrollView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
    
    @objc func handleRefreshControl() {
        //진동 추가
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
        feedbackGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            self.scrollView.refreshControl?.endRefreshing()
        }
    }
    
}

extension BankAccountViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 87
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = bankAccountTableView.dequeueReusableCell(withIdentifier: BankAccountTableViewCell.identifier, for: indexPath) as? BankAccountTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.dataBind(bankAccountList[indexPath.row])
        return cell
    }
}

extension BankAccountViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let shouldShowSticky = scrollView.contentOffset.y > stickyHeaderView.frame.minY
        headerView.isHidden = !shouldShowSticky
    }
}

extension BankAccountViewController: BankAccountNaviBarDelegate {
    
    func popToMainVC() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension BankAccountViewController: BankAccountUpperViewDelegate {
    
    func pushToTransferVC() {
        let transferVC = TransferViewController()
        transferVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(transferVC, animated: true)
    }
}

