//
//  MyAccountTargetType.swift
//  KAKAOBANK-iOS
//
//  Created by 김민서 on 5/22/24.
//

import Foundation

import Moya

enum MyAccountTargetType {
    case getMyAccountInfo(accountId: Int)
}

extension MyAccountTargetType: BaseTargetType {
    var utilPath: String {
        return "/api/v1/"
    }
    
    var path: String {
        switch self {
        case .getMyAccountInfo(let accountId):
            return utilPath + "account-info/\(accountId)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        return .requestPlain
    }
}
