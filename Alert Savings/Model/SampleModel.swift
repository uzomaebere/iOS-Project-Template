//
//  SampleModel.swift
//  Alert Savings
//
//  Created by Uzoma on 12/12/2024.
//

import Foundation

struct LoginRequest: Codable {
    let email: String
    let password: String
}

// MARK: - SignUpResponse
struct SignUpResponse: Codable {
    let status, message: String
    let data: DataClassSignUp
}

// MARK: - DataClass
struct DataClassSignUp: Codable {
    let id, firstName, lastName, email: String
    let phoneNumber, state, address: String
    let isEmailVerified: Bool
    let accountStatus, roleID, createdAt: String
    let locationCoordinates: [Double]
    let refreshToken: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case phoneNumber = "phone_number"
        case state, address, isEmailVerified, accountStatus
        case roleID = "roleId"
        case createdAt
        case locationCoordinates = "location_coordinates"
        case refreshToken
    }
}


//MARK: - LoginResponse

struct LoginResponse: Codable {
    let status: String
    let message: String
    let data: UserDetails?
}


//MARK: - ForgotPassword
struct ForgotPasswordRequest: Codable{
    let email : String
}

//MARK: - SignUpRequest
struct SignUpRequest: Codable {
    let first_name: String
    let last_name: String
    let email: String
    let phone_number: String
    let address: String
    let state: String
    let password: String
    let location_coordinates: [Double]?
}
//MARK: - User

struct UserDetails: Codable {

    let id: String
    let firstname: String
    let lastname: String
    let email: String
    let phonenumber: String
    let state: String
    let address: String
    let isEmailVerified: Bool
    let roleId: RoleID
    let token: String
    let location: [Double]?
}

extension UserDetails {
    enum CodingKeys: String, CodingKey{
        case email, state, address, isEmailVerified, token
        case firstname = "first_name"
        case lastname = "last_name"
        case phonenumber = "phone_number"
        case id = "_id"
        case roleId
        case location = "location_coordinates"
    }
}

//MARK: - RoleID
struct RoleID: Codable {
    let id, name: String
}
    extension RoleID{
        enum CodingKeys: String, CodingKey {
            case id = "_id"
            case name = "name"
  }
}

