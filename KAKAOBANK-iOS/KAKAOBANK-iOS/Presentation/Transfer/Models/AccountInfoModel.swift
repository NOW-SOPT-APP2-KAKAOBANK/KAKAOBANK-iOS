//
//  AccountInfoModel.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/14/24.
//

import UIKit

struct AccountInfoModel {
    let bankImg: UIImage
    let bankbookName: String
    let accountNumber: String
    let favorites: Bool? = false
}

extension AccountInfoModel {
    
    static let myAccountInfoAppData:  [AccountInfoModel] = [
        AccountInfoModel(bankImg: .btnKakaoBankIos, bankbookName: "윤희슬의 통장", accountNumber: "카카오뱅크 3333-23-9165754")
    ]
    
    static let recentTransferInfoAppData:  [AccountInfoModel] = [
        AccountInfoModel(bankImg: .btnNonghupBankIos, bankbookName: "윤희슬", accountNumber: "농협 3333-23-9165754"),
        AccountInfoModel(bankImg: .btnKakaoBankIos, bankbookName: "김민서", accountNumber: "카카오 뱅크 3333-23-9165754"),
        AccountInfoModel(bankImg: .btnKukminBankIos, bankbookName: "오서영", accountNumber: "국민 3333-23-9165754")
    ]
}
