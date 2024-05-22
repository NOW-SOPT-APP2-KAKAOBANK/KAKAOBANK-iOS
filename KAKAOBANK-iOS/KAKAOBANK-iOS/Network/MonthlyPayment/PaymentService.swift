//
//  TransactionService.swift
//  KAKAOBANK-iOS
//
//  Created by 김민서 on 5/22/24.
//

import Foundation

import Moya


protocol PaymentServiceProtocol {
    func getPayment(accountId: Int, month: Int, completion: @escaping (NetworkResult<GetPaymentResponse>) -> Void)
}

final class PaymentService: BaseService, PaymentServiceProtocol {
    
    static let shared = PaymentService()
    let provider = MoyaProvider<PaymentTargetType>(plugins: [MoyaLoggingPlugin()])
    
    func getPayment(accountId: Int, month: Int, completion: @escaping (NetworkResult<GetPaymentResponse>) -> Void) {
        provider.request(.getPayment(accountId: accountId, month: month)) { response in
            switch response {
            case .success(let result):
                let statusCode = result.statusCode
                let data = result.data
                
                let networkResult: NetworkResult<GetPaymentResponse> = self.judgeStatus(statusCode: statusCode, data: data)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
