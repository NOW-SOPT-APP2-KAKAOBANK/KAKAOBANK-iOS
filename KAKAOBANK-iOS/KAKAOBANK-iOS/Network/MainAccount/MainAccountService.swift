//
//  MainAccountService.swift
//  KAKAOBANK-iOS
//
//  Created by 오서영 on 5/22/24.
//

import Foundation
import Moya

protocol MainAccountServiceProtocol {
    func getAccountInfo(accountId: Int, completion: @escaping (Result<GetMainAccountResponse, Error>) -> Void)
}

final class MainAccountService: MainAccountServiceProtocol {
    private let provider = MoyaProvider<MainAccountTargetType>()
    
    func getAccountInfo(accountId: Int, completion: @escaping (Result<GetMainAccountResponse, Error>) -> Void) {
        provider.request(.getAccountInfo(accountId: accountId)) { result in
            switch result {
            case .success(let response):
                do {
                    let accountInfo = try JSONDecoder().decode(GetMainAccountResponse.self, from: response.data)
                    completion(.success(accountInfo))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
