//
//  Protocols.swift
//  dummy_social-media
//
//  Created by Osman Güler on 8.05.2023.
//
//          Router
//             ↑
// View <-> Presenter <-> Interactor <-> Entity

// Sağdan sola carrier protocol'leri oluşturuyor. Buralarda metotlar oluyor.
//Soldan sağa main protocol'leri oluşturuyor. Buralarda ilgili instance'lar oluyor
import Foundation
import UIKit


protocol PresenterToViewLoginProtocol: AnyObject {
    func loginUser(email: String, password: String)
}

protocol PresenterToInteractorLoginProtocol: AnyObject {
    var presenter: InteractorToPresenterLoginProtocol? { get set }
    func fetchUser()
}

protocol PresenterToRouterLoginProtocol: AnyObject {
    static func createModule() -> UIViewController
    func navigateToAnotherScreen()
}

protocol InteractorToPresenterLoginProtocol: AnyObject {
    func onUserFetched(_ user: UserEntity)
}

protocol ViewToPresenterLoginProtocol: AnyObject {
    var view: PresenterToViewLoginProtocol? { get set }
    var interactor: PresenterToInteractorLoginProtocol? { get set }
    var router: PresenterToRouterLoginProtocol? { get set }
    
    func viewDidLoad()
    func LoginButtonClicked()
    func loginUser(email:String, password: String)
}
