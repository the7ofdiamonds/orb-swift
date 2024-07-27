//
//  ViewModelChange.swift
//  orbfin
//
//  Created by Jamel Lyons on 7/27/24.
//

import Foundation

@MainActor
class ViewModelChange: ObservableObject {
    @Published var successMessage: String = ""
    @Published var error: NetworkError? = nil
    @Published var errorMessage: String = ""
    @Published var showingAlert: Bool = false
    @Published var username: String = ""
    @Published var name: String = ""
    @Published var phone: String = ""
    
    func changeUsername(email: String, password: String, username: String) async {
        let requestChangeUsername = RequestChangeUsername(email: email, password: password, username: username)
        
        do {
            let responseChangeUsername: ResponseChange = try await Change().username(requestChangeUsername: requestChangeUsername)
            
            if let successMessage = responseChangeUsername.successMessage {
                self.successMessage = successMessage
            }
            
            if let username = responseChangeUsername.item {
                self.username = username
            }
            
            if let errorMessage = responseChangeUsername.errorMessage {
                self.errorMessage = errorMessage
                self.showingAlert = true
            }
        } catch {
            self.error = error as? NetworkError
            self.showingAlert = true
        }
    }
    
    func changePassword(password: String, confirmPassword: String) async {
        let requestChangePassword = RequestChangePassword(password: password, confirmPassword: confirmPassword)
        
        do {
            let responseChangePassword: ResponseChange = try await Change().password(requestChangePassword: requestChangePassword)
            
            if let successMessage = responseChangePassword.successMessage {
                self.successMessage = successMessage
            }
            
            if let errorMessage = responseChangePassword.errorMessage {
                self.errorMessage = errorMessage
                self.showingAlert = true
            }
        } catch {
            self.error = error as? NetworkError
            self.showingAlert = true
        }
    }
    
    func changeName(email: String, firstName: String, lastName: String) async {
        let requestChangeName = RequestChangeName(email: email, firstName: firstName, lastName: lastName)
        
        do {
            let responseChangeName: ResponseChange = try await Change().name(requestChangeName: requestChangeName)
            
            if let successMessage = responseChangeName.successMessage {
                self.successMessage = successMessage
            }
            
            if let name = responseChangeName.item {
                self.name = name
            }
            
            if let errorMessage = responseChangeName.errorMessage {
                self.errorMessage = errorMessage
                self.showingAlert = true
            }
        } catch {
            self.error = error as? NetworkError
            self.showingAlert = true
        }
    }
    
    func changePhone(email: String, phone: String) async {
        let requestChangePhone = RequestChangePhone(email: email, phone: phone)
        
        do {
            let responseChangePhone: ResponseChange = try await Change().phone(requestChangePhone: requestChangePhone)
            
            if let successMessage = responseChangePhone.successMessage {
                self.successMessage = successMessage
            }
            
            if let phone = responseChangePhone.item {
                self.phone = phone
            }
            
            if let errorMessage = responseChangePhone.errorMessage {
                self.errorMessage = errorMessage
                self.showingAlert = true
            }
        } catch {
            self.error = error as? NetworkError
            self.showingAlert = true
        }
    }
}
