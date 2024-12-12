//
//  NetworkRequest.swift
//  Alert Savings
//
//  Created by Uzoma on 12/12/2024.
//

import Foundation
import UIKit


// MARK: - Network Errors
enum HTTPError: Error {
    case networkError(String)
}


// MARK: - NetworkRequest
protocol NetworkRequest: AnyObject {
    associatedtype ResponseType
    func decode(_ data: Data) -> ResponseType?
    func execute(withCompletion completion: @escaping (Result<ResponseType, HTTPError>?) -> Void)
    
}

extension NetworkRequest {
    
    fileprivate func load(_ urlRequest: URLRequest, withCompletion completion: @escaping (Result<ResponseType, HTTPError>?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, response, error) -> Void in
            if let error = error {
               print("Error" + error.localizedDescription )
                DispatchQueue.main.async {
                    completion(.failure(HTTPError.networkError(error.localizedDescription)))
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...205).contains(httpResponse.statusCode) else {
                guard let error1 = self?.handleError(data: data!) else { return }
                DispatchQueue.main.async {
                    completion(.failure(HTTPError.networkError(error1.message)))
                }
                return
            }
            
            guard let data = data, let value = self?.decode(data) else {
                DispatchQueue.main.async { completion(nil) }
                return
            }
            DispatchQueue.main.async {
                completion(.success(value))
            }
            
        }
        task.resume()
        
        
    }
    
    func handleError(data: Data) -> ErrorResponse? {
        let decoder = JSONDecoder()
        let body = try? decoder.decode(ErrorResponse.self, from: data)
        return body
    }
    
}


// MARK: - APIRequest
class APIRequest<Resource: APIResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension APIRequest: NetworkRequest {
   
    func execute(withCompletion completion: @escaping (Result<Resource.ResponseType, HTTPError>?) -> Void) {
        load(resource.request, withCompletion: completion)
    }
    
    func decode(_ data: Data) -> Resource.ResponseType? {
        let decoder = JSONDecoder()
        let model = try? decoder.decode(Resource.ResponseType.self, from: data)
        return model
    }
}

// MARK: - APIResource
protocol APIResource {
    associatedtype ResponseType: Codable
    associatedtype RequestType: Codable
    var methodPath: String { get }
    var httpMethod: String { get }
    var token: String? { get }
    var body: RequestType? { get }
}

extension APIResource {
    
    var body: RequestType? { return nil }
    
    var request: URLRequest {
        
        let baseUrl = URL(string: "enter base url here")
        let url = URL(string: methodPath, relativeTo: baseUrl)
        
        var urlRequest = URLRequest(url: url!)
        
        urlRequest.httpMethod = httpMethod
        if httpMethod == "POST" || httpMethod == "PUT" {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
            
            let encoder = JSONEncoder()
            let jsonData = try! encoder.encode(body)
            urlRequest.httpBody = jsonData
        }
        
        // if token is required or passed
        if let token = token {
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        
        return urlRequest
    }
    
}
