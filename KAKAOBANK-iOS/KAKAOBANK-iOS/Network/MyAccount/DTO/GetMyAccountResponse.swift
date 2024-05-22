//
//  GetMyAccountResponse.swift
//  KAKAOBANK-iOS
//
//  Created by 김민서 on 5/22/24.
//

import Foundation

struct GetMyAccountResponse: Codable {
    let accountName: String
    let balance: Int
    let accountNumber: Int
}


