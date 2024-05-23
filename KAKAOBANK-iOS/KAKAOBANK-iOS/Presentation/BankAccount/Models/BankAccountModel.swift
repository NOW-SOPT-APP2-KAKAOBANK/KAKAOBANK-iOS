//
//  BankAccountModel.swift
//  KAKAOBANK-iOS
//
//  Created by 김민서 on 5/15/24.
//

import Foundation

struct BankAccountModel {
    let dateLabel: String
    let transactionLabel: String
    let tagLabel: String
    let transactionAmountLabel: String
    let totalAmountLabel: String
}

extension BankAccountModel {
    static let transactionData:[BankAccountModel] = [
        BankAccountModel(dateLabel: "05.21", transactionLabel: "ㅎㅎㅎ", tagLabel: "#키득키득", transactionAmountLabel: "0원", totalAmountLabel: "0원")]
}

