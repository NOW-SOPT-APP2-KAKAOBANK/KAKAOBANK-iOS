//
//  GetRecentTransferResponseDTO.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/21/24.
//

import Foundation

struct GetRecentTransferResponse: Codable {
    let accountName: String
    let accountNumber: Int
    let isAccountLike: Bool
    let createdAt, bankName: String
    let imgURL: String
    let accountID: Int

    enum CodingKeys: String, CodingKey {
        case accountName, accountNumber, isAccountLike, createdAt, bankName
        case imgURL = "imgUrl"
        case accountID = "accountId"
    }
}
