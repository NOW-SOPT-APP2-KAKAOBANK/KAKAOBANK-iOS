//
//  TransferService.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/21/24.
//

import Foundation

import Moya

protocol TransferServiceProtocol {
    func getRecentTransfer(accountId: Int, completion: @escaping (NetworkResult<[GetRecentTransferResponseDTO]>) -> Void)
}

final class TransferService: BaseService, TransferServiceProtocol {
    
    let provider = MoyaProvider<TransferTargetType>(plugins: [MoyaLoggingPlugin()])
    
    func getRecentTransfer(accountId: Int, completion: @escaping (NetworkResult<[GetRecentTransferResponseDTO]>) -> Void) {
        provider.request(.getRecentTransfers(accountId: accountId)) { response in
            switch response {
            case .success(let result):
                let statusCode = result.statusCode
                let data = result.data
                
                let networkResult: NetworkResult<[GetRecentTransferResponseDTO]> = self.judgeStatus(statusCode: statusCode, data: data)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
