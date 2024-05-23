//
//  AccountInfoModel.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/14/24.
//

import UIKit

struct AccountInfoModel {
    let accountName: String
    let accountNumber: Int
    var isAccountLike: Bool
    let bankName: String
    let imgURL: String
    let accountID: Int
    
    enum CodingKeys: String, CodingKey {
        case accountName
        case accountNumber
        case isAccountLike
        case bankName
        case imgURL = "imgUrl"
        case accountID = "accountId"
    }
}

extension AccountInfoModel {
    
        static let myAccountInfoAppData:  [AccountInfoModel] = [
            AccountInfoModel(accountName: "윤희슬의 통장", accountNumber: 3333239165754, isAccountLike: false, bankName: "카카오뱅크", imgURL: "",  accountID: 1)
        ]
}
