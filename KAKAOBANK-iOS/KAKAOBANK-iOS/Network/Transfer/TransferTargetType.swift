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
    case deleteBookmarkState(myAccountId: Int, markedAccountId: Int)
}

extension TransferTargetType: BaseTargetType {
    
    var utilPath: String {
        return "/api/v1/"
    }
    
    var method: Moya.Method {
        switch self {
        case .getRecentTransfers:
            return .get
        case .deleteBookmarkState:
            return .delete
        }
    }
    
    var path: String {
        switch self {
        case .getRecentTransfers(let accountId):
            return utilPath + "recent-transfers/\(accountId)"
        case .deleteBookmarkState(let myAccountId, let markedAccountId):
            return utilPath + "recent-transfers/\(myAccountId)/bookmark/\(markedAccountId)"
        }
    }
    
    var task: Moya.Task {
        return .requestPlain
    }

}
