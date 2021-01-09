//
//  APIClient.swift
//  BemobileGNB
//
//  Created by Admin on 09/01/2021.
//

import Foundation

enum ErrorType: String {
    case network = "network"
    case undefined = "undefined"
}

enum RequestResult<T: Codable> {
    case success(response: T)
    case error(response: ErrorType)
}

final class APIClient {
    class func requestCurrencyRates(completion: @escaping(RequestResult<[RateModel]>) -> Void) {
        let urlRequest = URLRequest(url: URL(string: Constants.API.baseURL + Constants.API.Endpoints.currencyRates)!)
        performRequest(urlRequest, completion: completion)
    }
    
    private class func performRequest<T: Codable>(_ urlRequest: URLRequest, completion: @escaping(RequestResult<T>) -> Void) {
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error, (error as? NSError)?.code == NSURLErrorNotConnectedToInternet {
                completion(.error(response: .network))
                return
            }
            
            guard let urlResponse = response as? HTTPURLResponse else {
                completion(.error(response: .undefined))
                return
            }
            
            switch urlResponse.statusCode {
            case 200:
                if let data = data, let object = try? JSONDecoder().decode(T.self, from: data) {
                    completion(.success(response: object))
                } else {
                    completion(.error(response: .undefined))
                }
            default:
                completion(.error(response: .undefined))
            }
        }.resume()
    }
}
