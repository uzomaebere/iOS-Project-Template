//
//  ErrorResponse.swift
//  Alert Savings
//
//  Created by Uzoma on 12/12/2024.
//

import Foundation

struct ErrorResponse: Decodable {
    let status: String
    let message: String
}
