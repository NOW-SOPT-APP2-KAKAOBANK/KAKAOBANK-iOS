//
//  MainAccountTargetType.swift
//  KAKAOBANK-iOS
//
//  Created by 오서영 on 5/22/24.
//

import Foundation
import Moya

enum MainAccountTargetType {
    case getAccountInfo(accountId: Int)
}

extension MainAccountTargetType: BaseTargetType {
    
    var utilPath: String {
        return "/api/v1/"
    }
    
    var method: Moya.Method {
        switch self {
        case .getAccountInfo:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getAccountInfo(let accountId):
            return utilPath + "account-info/\(accountId)"
        }
    }
    
    var task: Moya.Task {
        return .requestPlain
    }
}
