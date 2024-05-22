//
//  NetworkService.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/21/24.
//

import Foundation

final class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    let transferService: TransferService = TransferService()
    
    let bookmarkService: BookmarkService = BookmarkService()
    
    let mainAccountService: MainAccountService = MainAccountService()

}
