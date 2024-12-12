//
//  SampleViewModel.swift
//  Alert Savings
//
//  Created by Uzoma on 12/12/2024.
//

import Foundation

class SampleViewModel: ObservableObject{
    
//    @Published var loginResponse: LoginResponse?
//    @Published var signUpResponse: SignUpResponse?
//    @Published var isLoading = false
//    @Published var errorMessage: String?
//    @Published var isError = false
//    @Published var isSuccess = false
//    @Published var displayMessage : String?
//    @Published var showAlert = false
//
//    private var loginRequest: APIRequest<LoginResource>?
//    private var forgotPasswordRequest: APIRequest<ForgotPasswordResources>?
//    private var signUpRequest: APIRequest<SignUpResources>?
//
//    func loginUser(email: String, password: String) {
//        guard !isLoading else { return }
//        isLoading = true
//
//        let resource = LoginResource(email: email, password: password)
//        let request = APIRequest(resource: resource)
//        self.loginRequest = request
//
//        request.execute { [weak self] response in
//            self?.isLoading = false
//            switch response {
//
//            case .success(let str):
//                self?.loginResponse = str
//                guard let accessToken = self?.loginResponse?.data?.token else {return}
//                let data = Data(accessToken.utf8)
//                KeychainHelper.standard.save(data, service: "accessToken", account: "choplaye")
//
//                guard let firstname = self?.loginResponse?.data?.firstname else { return }
//                KeychainHelper.standard.save(Data(firstname.utf8), service: "firstName", account: "choplaye")
//                guard let lastname = self?.loginResponse?.data?.lastname else { return }
//                KeychainHelper.standard.save(Data(lastname.utf8), service: "lastName", account: "choplaye")
//                guard let email = self?.loginResponse?.data?.email else { return }
//                KeychainHelper.standard.save(Data(email.utf8), service: "email", account: "choplaye")
//                guard let phone = self?.loginResponse?.data?.phonenumber else { return }
//                KeychainHelper.standard.save(Data(phone.utf8), service: "phone", account: "choplaye")
//                self?.isSuccess = true
//
//            case .failure(let error):
//                self?.isError = true
//                switch error{
//                case .networkError(let errMsg):
//                    self?.errorMessage = errMsg
//                }
//            case .none:
//                print("")
//            }
//
//        }
//    }
//
//    func forgotPassword(email: String) {
//            if !isLoading{
//                isLoading = true
//            }
//            else { return }
//            let resource = ForgotPasswordResources(email: email)
//            let request = APIRequest(resource: resource)
//            self.forgotPasswordRequest = request
//            request.execute { [weak self] response in
//                guard response != nil else {
//                    self?.isLoading = false
//                    return
//                }
//                self?.isLoading = false
//                switch response {
//                case .success(let str):
//                    self?.loginResponse = str
//                    self?.isSuccess = true
//                case .failure(let error):
//                    self?.isError = true
//                    switch error{
//                    case .networkError(let errMsg):
//                        self?.errorMessage = errMsg
//                    }
//                case .none:
//                    print("None")
//                }
//
//
//            }
//        }
//
//    func signUpUser(firstName: String, lastName: String, email: String, phoneNumber:String, address: String, state:String, password:String, locationCoordinate : [Double]){
//        guard !isLoading else { return }
//        isLoading = true
//
//        let resource = SignUpResources(first_name: firstName, last_name: lastName, email: email, phone_number: phoneNumber, address: address, state: state, password: password, location_coordinates: locationCoordinate )
//        let request = APIRequest(resource: resource)
//        self.signUpRequest = request
//
//        request.execute { [weak self] response in
//            self?.isLoading = false
//
//            switch response{
//            case .success(let str):
//                print("Sucess")
//                self?.showAlert = true
//                self?.isSuccess = true
//                self?.signUpResponse = str
//                self?.displayMessage = self?.signUpResponse?.message
//
//            case .failure(let error):
//                print("Error")
//                self?.showAlert = true
//                self?.isError = true
//                switch error{
//                case .networkError(let errMsg):
//                    self?.errorMessage = errMsg
//                    self?.displayMessage = errMsg.description
//                }
//            case .none:
//                print("")
//            }
//        }
//    }
    
  
}
