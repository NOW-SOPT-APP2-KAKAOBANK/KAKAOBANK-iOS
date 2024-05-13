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
    
    
    // MARK: - Properties

    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNaviBar()
        setHierarchy()
        setLayout()
        setStyle()
        setDelegate()
    }

}


// MARK: - Private Methods

private extension TransferViewController {
    
    func setNaviBar() {
        
        self.rightItem.customView = transferNaviBar
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    func setHierarchy() {
        
    }
    
    func setLayout() {

    }
    
    func setStyle() {

        self.view.backgroundColor = UIColor(resource: .white)
    }
    
    func setDelegate() {
        
        transferNaviBar.delegate = self
    }
    
}


// MARK: - Delegates

extension TransferViewController: TransferNaviBarDelegate {
    
    func popToMainVC() {
        print("tap")
//        self.navigationController?.popViewController(animated: true)
    }
    
}


