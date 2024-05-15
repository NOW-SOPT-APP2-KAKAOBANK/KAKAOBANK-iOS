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
    static func dummy() -> [BankAccountModel] {
        return [
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자",tagLabel: "#예금이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.21", transactionLabel: "김미정",tagLabel: "", transactionAmountLabel: "-150,000원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.21", transactionLabel: "세이프박스",tagLabel: "#예금이자", transactionAmountLabel: "150,000원", totalAmountLabel: "150원"),
            BankAccountModel(dateLabel: "03.17", transactionLabel: "김미정",tagLabel: "", transactionAmountLabel: "-50,000원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.17", transactionLabel: "세이프박스",tagLabel: "#예금이자", transactionAmountLabel: "50,000원", totalAmountLabel: "50,000원"),
            BankAccountModel(dateLabel: "03.15", transactionLabel: "토스 김미정",tagLabel: "#자동이체", transactionAmountLabel: "-50,000원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.15", transactionLabel: "세이프박스",tagLabel: "", transactionAmountLabel: "50,000원", totalAmountLabel: "50,000원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자",tagLabel: "#예금이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자",tagLabel: "#예금이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자",tagLabel: "#예금이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자",tagLabel: "#예금이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자",tagLabel: "#예금이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자",tagLabel: "#예금이자", transactionAmountLabel: "0원", totalAmountLabel: "0원"),
            BankAccountModel(dateLabel: "03.24", transactionLabel: "입출금통장 이자",tagLabel: "#예금이자", transactionAmountLabel: "0원", totalAmountLabel: "0원")
            ]
    }
}
