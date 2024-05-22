//
//  MyAccountService.swift
//  KAKAOBANK-iOS
//
//  Created by 김민서 on 5/22/24.
//

import Foundation

import Moya


protocol MyAccountServiceProtocol {
    func getMyAccount(accountId: Int, completion: @escaping (NetworkResult<GetMyAccountResponse>) -> Void)
}

final class MyAccountService: BaseService, MyAccountServiceProtocol {
    static let shared = MyAccountService()
    let provider = MoyaProvider<MyAccountTargetType>(plugins: [MoyaLoggingPlugin()])
    
    func getMyAccount(accountId: Int, completion: @escaping (NetworkResult<GetMyAccountResponse>) -> Void) {
        provider.request(.getMyAccountInfo(accountId: accountId)) { response in
            switch response {
            case .success(let result):
                let statusCode = result.statusCode
                let data = result.data
                
                let networkResult: NetworkResult<GetMyAccountResponse> = self.judgeStatus(statusCode: statusCode, data: data)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
