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
    let transactionAmountLabel: String
    let totalAmountLabel: String
}

extension BankAccountModel {
    static func dummy() -> [BankAccountModel] {
        return [
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자", transactionAmountLabel: "0원", totalAmountLabel: "0원")
        ]
    }
}
