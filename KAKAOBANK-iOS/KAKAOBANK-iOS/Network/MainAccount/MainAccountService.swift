import Foundation
import Moya

protocol MainAccountServiceProtocol {
    func getAccountInfo(accountId: Int, completion: @escaping (NetworkResult<GetMainAccountResponse>) -> Void)
}

final class MainAccountService: BaseService, MainAccountServiceProtocol {
    private let provider = MoyaProvider<MainAccountTargetType>(plugins: [MoyaLoggingPlugin()])
        
    func getAccountInfo(accountId: Int, completion: @escaping (NetworkResult<GetMainAccountResponse>) -> Void) {
        provider.request(.getAccountInfo(accountId: accountId)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult: NetworkResult<GetMainAccountResponse> = self.judgeStatus(statusCode: statusCode, data: data)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
}

