//
//  TransactionTargetType.swift
//  KAKAOBANK-iOS
//
//  Created by 김민서 on 5/22/24.
//

import Foundation

import Moya

enum PaymentTargetType {
    case getPayment(accountId: Int, month: Int)
}

extension PaymentTargetType: BaseTargetType {
    var utilPath: String {
        return "/api/v1/"
    }
    
    var path: String {
        switch self {
        case .getPayment(let accountId, _):
            return "/api/v1/payment/\(accountId)"
        }
    }

    
    var method: Moya.Method {
        switch self {
        case .getPayment:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getPayment(_, let month):
            return .requestParameters(parameters: ["month": month], encoding: URLEncoding.default)
        }
    }
}
