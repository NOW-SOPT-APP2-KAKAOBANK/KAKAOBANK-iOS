//
//  BankAccountViewController.swift
//  KAKAOBANK-iOS
//
//  Created by 김민서 on 5/14/24.
//

import UIKit

final class BankAccountViewController: UIViewController {
    
    private let bankAccountNaviBar = BankAccountNaviBar()

    override func loadView() {
        self.view = bankAccountNaviBar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        setDelegate()
        
    }
}

private extension BankAccountViewController {
    
    func setHierarchy() {

    }
    
    func setLayout() {

    }
    
    func setStyle() {
        self.view.backgroundColor = UIColor(resource: .main)
    }
    
    func setDelegate() {
        
    }
}
