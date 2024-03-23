//
//  LoginViewModel.swift
//  SwiftApp
//
//  Created by Thiệp Trần Huy on 23/03/2024.
//

import Foundation
import Firebase

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    
    func login() {
        print("Username: \(username), Password: \(password)")
        Auth.auth().signIn(withEmail: username, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let error = error {
                strongSelf.errorMessage = error.localizedDescription
                print("Login Error: \(error.localizedDescription)")
                return
            }
            if let authResult = authResult {
                print("Login Successful! User ID: \(authResult.user.uid)")
                strongSelf.isLoggedIn = true
            }
        }
    }
    
    func createUser(completion: @escaping (Result<User, Error>) -> Void) {
            Auth.auth().createUser(withEmail: username, password: password) { authResult, error in
                if let error = error {
                    completion(.failure(error))
                } else if let authResult = authResult {
                    completion(.success(authResult.user))
                }
            }
        }

}
