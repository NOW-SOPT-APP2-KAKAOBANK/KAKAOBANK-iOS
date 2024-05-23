//
//  MainAccountService.swift
//  KAKAOBANK-iOS
//
//  Created by 오서영 on 5/22/24.
//

import Foundation
import Moya

protocol MainAccountServiceProtocol {
    func getAccountInfo(accountId: Int, completion: @escaping (NetworkResult<GetMainAccountResponse>) -> Void)
}

final class MainAccountService: MainAccountServiceProtocol {
    private let provider = MoyaProvider<MainAccountTargetType>()
        
    func getAccountInfo(accountId: Int, completion: @escaping (NetworkResult<GetMainAccountResponse>) -> Void) {
        provider.request(.getAccountInfo(accountId: accountId)) { result in
            switch result {
            case .success(let response):
                do {
                    let accountInfo = try JSONDecoder().decode(GetMainAccountResponse.self, from: response.data)
                    completion(.success(accountInfo))
                } catch {
                    completion(.decodedErr)
                }
            case .failure(let error):
                if let moyaError = error as? MoyaError {
                    switch moyaError {
                    case .underlying(let nsError as NSError, _):
                        if nsError.domain == NSURLErrorDomain {
                            completion(.networkFail)
                        } else {
                            completion(.serverErr)
                        }
                    case .statusCode(let response):
                        switch response.statusCode {
                        case 400..<500:
                            completion(.requestErr)
                        case 500..<600:
                            completion(.serverErr)
                        default:
                            completion(.pathErr)
                        }
                    default:
                        completion(.pathErr)
                    }
                } else {
                    completion(.pathErr)
                }
            }
        }
    }
}
