//
//  TransferAPI.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/21/24.
//

import Foundation

import Moya

enum TransferTargetType {
    case getRecentTransfers(accountId: Int)
}

extension TransferTargetType: BaseTargetType {
    
    var utilPath: String {
        return "/api/v1/"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var path: String {
        switch self {
        case .getRecentTransfers(let accountId):
            return utilPath + "recent-transfers/\(accountId)"
        }
    }
    
    var task: Moya.Task {
        return .requestPlain
    }

}
