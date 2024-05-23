//
//  GetPaymentResponse.swift
//  KAKAOBANK-iOS
//
//  Created by 김민서 on 5/22/24.
//
import Foundation

struct GetPaymentResponse: Codable {
    let payment: Int
    let monthlyTransferList: [MonthlyTransferList]
}


struct MonthlyTransferList: Codable {
    let accountName: String
    let date: String
    let transferAmount: Int
    let balance: Int
    let hashTag: String?
}

extension MonthlyTransferList {
    func toBankAccountModel() -> BankAccountModel {
        return BankAccountModel(
            dateLabel: self.date,
            transactionLabel: self.accountName,
            tagLabel: self.hashTag ?? "",
            transactionAmountLabel: "\(self.transferAmount)원",
            totalAmountLabel: "\(self.balance)원"
        )
    }
}

