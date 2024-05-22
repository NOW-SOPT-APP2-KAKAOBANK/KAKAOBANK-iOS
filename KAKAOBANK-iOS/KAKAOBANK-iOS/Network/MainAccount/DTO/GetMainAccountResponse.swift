//
//  RequestDTO.swift
//  KAKAOBANK-iOS
//
//  Created by 오서영 on 5/22/24.
//
import Foundation

struct GetMainAccountResponse: Codable {
    let accountName: String
    let balance: Int
    let accountNumber: Int
}
