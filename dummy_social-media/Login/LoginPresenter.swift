//
//  LoginViewToPresenter.swift
//  dummy_social-media
//
//  Created by Osman Güler on 7.05.2023.
//

import Foundation

// ref to interactor, router and view




protocol AnyLoginPresenter {
    
    var loginRouter : UserRouter? {get set}
    var loginInteractor : LoginInteractor? {get set}
    var loginView : LoginView? {get set}
    
    func loginUser(email: String, password: String) -> Void
}


class LoginPresenter : AnyLoginPresenter  {
    
    var loginRouter: UserRouter?
    var loginInteractor: LoginInteractor?
    var loginView: LoginView?
    
    
    func loginUser(email: String, password: String)-> Void {
        var userList : [UserEntity]
        loginInteractor?.fetchUsers { result in
            switch result {
            case .success(let users):
                // Başarılı sonuç
                userList = users
            case .failure(let error):
                // Hata durumunda hatayı ele alabilirsiniz
                print("Hata: \(error)")
            }
        }
        if userList.contains(where: { $0.email == email && $0.password == password}){
            loginRouter?.presentHomeScreen()
        }
        else{
            let error = NSError(domain: "com.example.app", code: 0, userInfo: [NSLocalizedDescriptionKey: "Login failed"])
            return .failure(error)
        }
        
    }
    
}
extension LoginPresenter : LoginInteractorToPresenterProtocol {
    func onUserFetched(_ user: UserEntity) {
        <#code#>
    }
}
