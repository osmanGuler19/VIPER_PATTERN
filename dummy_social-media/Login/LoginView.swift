//
//  LoginView.swift
//  dummy_social-media
//
//  Created by Osman Güler on 1.05.2023.
//

import SwiftUI

//reference Presenter

protocol AnyLoginView {
    var loginPresenter : LoginPresenter? {get set}
    
}

struct InfoText: View {
    var body: some View {
        Text("Enter your login and password")
            .font(.system(size: 16, weight: .light))
            .foregroundColor(.primary)
    }
}

struct LoginView: View, AnyLoginView {
    var loginPresenter: LoginPresenter?
    
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    init() {
        setupNavigationBarAppearanceForLogin(titleColor: UIColor.white, barColor: UIColor(.blue))
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 28) {
                InfoText().padding(.top, 44)
                
                VStack(alignment: .leading, spacing: 11) {
                    Text("Login")
                        .font(.system(size: 13, weight: .light))
                        .foregroundColor(.secondary)
                        .frame(height: 15, alignment: .leading)
                    
                    TextField("", text: $email)
                        .font(.system(size: 17, weight: .thin))
                        .foregroundColor(.primary)
                        .frame(height: 44)
                        .padding(.horizontal, 12)
                        .background(Color.white)
                        .cornerRadius(4.0)
                }
                
                VStack(alignment: .leading, spacing: 11) {
                    Text("Password")
                        .font(.system(size: 13, weight: .light))
                        .foregroundColor(.secondary)
                        .frame(height: 15, alignment: .leading)
                    
                    SecureField("", text: $password)
                        .font(.system(size: 17, weight: .thin))
                        .foregroundColor(.primary)
                        .frame(height: 44)
                        .padding(.horizontal, 12)
                        .background(Color.white)
                        .cornerRadius(4.0)
                }
                
                Spacer()
                
                
                Button(action: { loginPresenter?.loginUser(email: email, password: password) }) {
                            Text("English")
                }
            }
            .padding()
            .background(.secondary.opacity(0.1))
            .navigationBarTitle("Login To SocialManga", displayMode: .inline)
            .buttonStyle(.bordered)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
