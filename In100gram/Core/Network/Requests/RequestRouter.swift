import Foundation
import Alamofire

enum RequestRouter: URLRequestConvertible {
    
    case getCurrentUser(parameters: Parameters)
    case getCurrentUserMedia(parameters: Parameters)
    
    static let baseURLString = "https://api.instagram.com/v1"
    
    var method: HTTPMethod { return .get }
    
    var path: String {
        switch self {
        case .getCurrentUser:
            return "/users/self"
        case .getCurrentUserMedia:
            return "/users/self/media/recent"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try RequestRouter.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .getCurrentUser(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case .getCurrentUserMedia(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }
}
