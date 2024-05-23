//
//  TransferService.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/21/24.
//

import Foundation

import Moya

protocol TransferServiceProtocol {
    func getRecentTransfer(accountId: Int, completion: @escaping (NetworkResult<[GetRecentTransferResponse]>) -> Void)
    func deleteBookmarkState(myAccountId: Int, markedAccountId: Int, completion: @escaping (Int) -> Void)
}

final class TransferService: BaseService, TransferServiceProtocol {
    
    let provider = MoyaProvider<TransferTargetType>(plugins: [MoyaLoggingPlugin()])
    
    func getRecentTransfer(accountId: Int, completion: @escaping (NetworkResult<[GetRecentTransferResponse]>) -> Void) {
        provider.request(.getRecentTransfers(accountId: accountId)) { response in
            switch response {
            case .success(let result):
                let statusCode = result.statusCode
                let data = result.data
                
                let networkResult: NetworkResult<[GetRecentTransferResponse]> = self.judgeStatus(statusCode: statusCode, data: data)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func deleteBookmarkState(myAccountId: Int, markedAccountId: Int, completion: @escaping (Int) -> Void) {
        provider.request(.deleteBookmarkState(myAccountId: myAccountId, markedAccountId: markedAccountId)) { result in
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
