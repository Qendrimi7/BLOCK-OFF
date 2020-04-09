//
//  AuthRouter.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/8/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

struct JSONStringArrayEncoding: ParameterEncoding {
    
    private let array: [[String : Any]]
    
    init(array: [[String : Any]]) {
        self.array = array
    }
    
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var urlRequest = try urlRequest.asURLRequest()
        
        let data = try JSONSerialization.data(withJSONObject: array, options: [])
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        urlRequest.httpBody = data
        
        return urlRequest
    }
}

enum AuthRouter: URLRequestConvertible {
    
    case createUser(parameters: Parameters)
    case googlePlusSignIn(parameters: Parameters)
    
    var method: HTTPMethod {
        switch self {
        case .createUser:
            return .post
        case .googlePlusSignIn:
            return .post
        }
    }
    
    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        let url = try baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
                
        switch self {
        case .googlePlusSignIn(let parameters):
            urlRequest = try URLEncoding.queryString.encode(urlRequest, with: parameters)
        case .createUser(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
        return urlRequest
    }
}
