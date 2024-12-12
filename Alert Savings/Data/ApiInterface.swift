//
//  ApiInterface.swift
//  Alert Savings
//
//  Created by Uzoma on 12/12/2024.
//  Declare the endpoints here using the samples commented below

import Foundation

// MARK: - LoginResource

struct LoginResource: APIResource {

    typealias RequestType = LoginRequest

    typealias ResponseType = LoginResponse

    var httpMethod: String = "POST"

    var token: String? = nil

    var methodPath: String = "customer/login"

    var email: String
    var password: String

    var body: RequestType? {
       return LoginRequest(email: email, password: password)

    }

}

// MARK: - GetOrders Resource
//struct GetOrdersResource: APIResource {
//
//    typealias RequestType = GetOrdersResponse
//
//    typealias ResponseType = GetOrdersResponse
//
//    var methodPath: String = "orders/history"
//
//    var httpMethod: String = "GET"
//
//    var token: String? {
//        let data = KeychainHelper.standard.read(service: "accessToken", account: "choplaye")!
//        let accessToken = String(data: data, encoding: .utf8)
//        return accessToken
//    }
//}
