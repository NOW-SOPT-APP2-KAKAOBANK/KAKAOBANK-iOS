//
//  BookmarkService.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/21/24.
//

import Foundation

import Moya

protocol BookmarkServiceProtocol {
    func postBookmarkState(myAccountId: Int, markedAccountId: Int, completion: @escaping (Int) -> Void)
}

final class BookmarkService: BaseService, BookmarkServiceProtocol {
    
    let provider = MoyaProvider<BookmarkTargetType>(plugins: [MoyaLoggingPlugin()])
    
    func postBookmarkState(myAccountId: Int,
                           markedAccountId: Int,
                           completion: @escaping (Int) -> Void) {
        provider.request(.postBookmarkState(myAccountId: myAccountId, markedAccountId: markedAccountId)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                completion(statusCode)
            case .failure(let response):
                completion(response.errorCode)
            }
        }
    }

}
