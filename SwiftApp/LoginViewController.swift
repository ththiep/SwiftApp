//
//  ContentView.swift
//  SwiftApp
//
//  Created by Thiệp Trần Huy on 23/03/2024.
//

import SwiftUI

struct LoginViewController: View {
    @ObservedObject var viewModel: LoginViewModel
    @State var isShowRegisterSheet: Bool = false
    var body: some View {
        NavigationView{
            VStack {
                Image("logo_app")
                    .resizable()
                    .frame(width: 100, height: 100)
                Spacer()
                    .frame(height: 100)
                VStack(spacing: 15){
                    TextField("Username", text: $viewModel.username)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(5.0)
                        .padding(.horizontal)
                    
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(5.0)
                        .padding(.horizontal)
                    
                    HStack {
                        Button(action: {
                            isShowRegisterSheet = true
                        }, label: {
                            Text("Create account")
                                .foregroundColor(.green)
                                .padding(.leading)
                        })
                        .sheet(isPresented: $isShowRegisterSheet, content: {
                            registerView()
                        })
                        
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Forgot password?")
                                .padding(.trailing)
                        })
                        
                    }
                }
                Button(action: {
                    viewModel.login()
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10.0)
                }
                .padding(.top, 50)
            }
            .padding()
            .background(NavigationLink(destination: HomeView(), isActive: $viewModel.isLoggedIn){})
            
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
    }
    
    func registerView() -> some View {
        VStack {
            HStack(spacing: 5){
                Text("Register")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                Image("logo_app")
                    .resizable()
                    .frame(width: 50, height: 50)
                
            }
            .padding(.bottom, 50)
            VStack(spacing: 15){
                TextField("Username", text: $viewModel.username)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                SecureField("Confirm Password", text: $viewModel.confirmPassword)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            Spacer()
                .frame(height: 50)
            VStack(spacing: 15){
                Button(action: {
                    viewModel.createUser() { result in
                        switch result {
                        case .success(let user):
                            print("User created successfully: \(user.uid)")
                            isShowRegisterSheet = false
                            viewModel.isLoggedIn = true
                        case .failure(let error):
                            print("Error creating user: \(error.localizedDescription)")
                        }
                    }
                }) {
                    Text("Register")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                .padding(.top, 20)
                
                Button(action: {
                    isShowRegisterSheet = false
                }) {
                    Text("Have account? Login")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
            }
        }
        .padding()
    }
}


#Preview {
    LoginViewController(viewModel: LoginViewModel())
}
