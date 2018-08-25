import Foundation
import Alamofire

protocol AbstractRequestFactory {
    var sessionManager: SessionManager { get }
    var queue: DispatchQueue { get }
    
    @discardableResult
    func request<T: Codable>(request: URLRequestConvertible, completion: @escaping (DataResponse<T>) -> Void) -> DataRequest
}

extension AbstractRequestFactory {
    
    @discardableResult
    func request<T: Codable>(request: URLRequestConvertible, completion: @escaping (DataResponse<T>) -> Void) -> DataRequest {
        return sessionManager.request(request).responseCodable(queue: queue, completion: completion)
    }
}

extension DataRequest {
    
    @discardableResult
    func responseCodable<T: Decodable>(queue: DispatchQueue? = nil,
                                       completion: @escaping (DataResponse<T>) -> Void) -> Self {
        let responseSerializer = DataResponseSerializer<T> { request, response, data, error in
            let result = Request.serializeResponseData(response: response, data: data, error: nil)
            
            switch result {
            case .success(let data):
                do {
                    let value = try JSONDecoder().decode(T.self, from: data)
                    return .success(value)
                } catch {
                    return .failure(error)
                }
            case .failure(let error):
                return .failure(error)
            }
        }
        return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completion)
    }
}
