//
//  Constants.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/13/24.
//

import UIKit

enum TransferSection {
    case input
    case myAccount
    case recentTransfer
    
    static let transferSections: [TransferSection] = [
        TransferSection.input,
        TransferSection.myAccount,
        TransferSection.recentTransfer
    ]
}
