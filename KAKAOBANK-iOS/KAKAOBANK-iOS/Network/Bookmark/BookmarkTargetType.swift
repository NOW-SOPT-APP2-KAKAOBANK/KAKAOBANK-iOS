//
//  BookmarkTargetType.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/21/24.
//

import Foundation

import Moya

enum BookmarkTargetType {
    case postBookmarkState(myAccountId: Int, markedAccountId: Int)
}

extension BookmarkTargetType: BaseTargetType {
    
    var utilPath: String {
        return "/api/v1/recent-transfers/"
    }
    
    var method: Moya.Method {
        switch self {
        case .postBookmarkState:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .postBookmarkState(let myAccountId, let markedAccountId):
            return utilPath + "\(myAccountId)/bookmark/\(markedAccountId)"
        }
    }
    
    var task: Moya.Task {
        return .requestPlain
    }
    
    
}
