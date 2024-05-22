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

extension MyAccountTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getMyAccountInfo(let accountId):
            return "/api/v1/account-info/\(accountId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMyAccountInfo:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getMyAccountInfo:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
