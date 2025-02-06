//
//  NetworkManager.swift
//  ios-mvvm-practice
//
//  Created by Goo on 2/6/25.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func shop<ResponseType: Decodable>(
        _ request: ShopRequest,
        _ responseT: ResponseType.Type,
        completionHandler: @escaping (ResponseType) -> Void,
        failureHandler: @escaping (AFError) -> Void
    ) {
        AF.request(
            request.endpoint,
            method: request.method,
            parameters: request.parameters,
            headers: request.header
        )
        .validate(statusCode: 200...299)
        .responseDecodable(of: responseT) { response in
            switch response.result {
            case .success(let data):
                completionHandler(data)
                    
            case .failure(let err):
                failureHandler(err)
//                guard let data = response.data else {
//                    failHandler(TMDBStatusCode(0))
//                    return
//                }
//                
//                do {
//                    let err = try JSONDecoder().decode(TMDBError.self, from: data)
//                    failHandler(TMDBStatusCode(err.status_code))
//                } catch {
//                    failHandler(TMDBStatusCode(0))
//                }
            }
        }
    }
}
