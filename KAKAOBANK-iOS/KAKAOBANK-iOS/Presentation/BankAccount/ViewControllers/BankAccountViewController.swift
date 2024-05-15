//
//  BankAccountViewController.swift
//  KAKAOBANK-iOS
//
//  Created by 김민서 on 5/14/24.
//

import UIKit

import SnapKit
import Then

final class BankAccountViewController: UIViewController {
    
    private let bankAccountNaviBar = BankAccountNaviBar()
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private let bankAccountTableView = UITableView()
    private let stickyHeaderView = StickyHeaderView()
    
    private var accountLabel = UILabel()
    private var underlineLabel = UILabel()
    private var balanceLabel = UILabel()
    private var wonLabel = UILabel()
    private var transferButton  = UIButton()
    private var takeButton = UIButton()
    
    private var balanceStackView = UIStackView()
    private var transferButtonStackView = UIStackView()
    
    private let bankAccountList = BankAccountModel.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        setDelegate()
        register()
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
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
    
    func setHierarchy() {
        self.view.addSubviews(scrollView,bankAccountNaviBar)
        
        scrollView.addSubview(contentView)
        self.contentView.addSubviews(accountLabel, underlineLabel, balanceStackView, transferButtonStackView, stickyHeaderView, bankAccountTableView)
    
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(wonLabel)
        
        transferButtonStackView.addArrangedSubview(transferButton)
        transferButtonStackView.addArrangedSubview(takeButton)
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
        
        accountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(37)
            $0.centerX.equalToSuperview()
        }
        
        underlineLabel.snp.makeConstraints {
            $0.top.equalTo(accountLabel.snp.bottom).offset(1)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(accountLabel)
            $0.height.equalTo(1)
        }
        
        balanceStackView.snp.makeConstraints {
            $0.top.equalTo(accountLabel.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }
        
        transferButton.snp.makeConstraints {
            $0.width.equalTo(145)
            $0.height.equalTo(50)
        }
        
        takeButton.snp.makeConstraints {
            $0.width.equalTo(145)
            $0.height.equalTo(50)
        }
        
        transferButtonStackView.snp.makeConstraints {
            $0.top.equalTo(balanceStackView.snp.bottom).offset(47)
            $0.centerX.equalToSuperview()
        }
        
        //스티키 헤더 뷰
        stickyHeaderView.snp.makeConstraints {
            $0.top.equalTo(transferButtonStackView.snp.bottom).offset(24)
            $0.leading.trailing.equalTo(scrollView)
            $0.height.equalTo(163)
        }
        
    }
    
    func setStyle() {
        self.view.backgroundColor = UIColor(resource: .main)
        self.navigationController?.isNavigationBarHidden = true
        bankAccountTableView.isScrollEnabled = true
        
        accountLabel.do {
            $0.attributedText = UILabel.attributedText(for: .body7, withText: "3333-17-1799152")
            $0.textColor = UIColor(resource: .yellow3)
        }
        
        underlineLabel.do {
            $0.backgroundColor = UIColor(resource: .yellow1)
        }
        
        balanceLabel.do {
            $0.attributedText = UILabel.attributedText(for: .head1, withText: "0")
            $0.textColor = UIColor(resource: .black2)
        }
        
        wonLabel.do {
            $0.attributedText = UILabel.attributedText(for: .head3, withText: "원")
            $0.textColor = UIColor(resource: .black2)
        }
        
        balanceStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 0
        }
        
        transferButton.do {
            $0.backgroundColor = .yellow0
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            let attributedText = UILabel.attributedText(for: .number3, withText: "이체하기")
            $0.setAttributedTitle(attributedText, for: .normal)
            $0.setTitleColor(.black2, for: .normal)
        }
        
        takeButton.do {
            $0.backgroundColor = .yellow0
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            let attributedText = UILabel.attributedText(for: .number3, withText: "가져오기")
            $0.setAttributedTitle(attributedText, for: .normal)
            $0.setTitleColor(.black2, for: .normal)
        }
        
        transferButtonStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 8
        }
        
        stickyHeaderView.do {
            $0.backgroundColor = .white
        }
        
        bankAccountTableView.do {
            $0.isScrollEnabled = false
            $0.separatorStyle = .none
        }
        
        
    }
    
    func setDelegate() {
        bankAccountTableView.delegate = self
        bankAccountTableView.dataSource = self
    }
    
    private func register() {
        bankAccountTableView.register(
            BankAccountTableViewCell.self,
            forCellReuseIdentifier: BankAccountTableViewCell.identifier
        )
    }
    
}

extension BankAccountViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 87
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
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

