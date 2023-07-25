//
//  LoginInteractor.swift
//  dummy_social-media
//
//  Created by Osman Güler on 27.05.2023.
//

import Foundation


protocol AnyLoginInteractor {
    var loginPresenter : LoginPresenter? {get set}
    
    func fetchUsers(completion: @escaping (Result<[UserEntity], Error>) -> Void)
    
}


class LoginInteractor : AnyLoginInteractor {
    var loginPresenter: LoginPresenter?
    
    func fetchUsers(completion: @escaping (Result<[UserEntity], Error>) -> Void) {
        let urlString = "https://dummyjson.com/users"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "InvalidURL", code: 0, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "NoData", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let users = try decoder.decode([UserEntity].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    
    func loginUser() {
        <#code#>
    }
}
