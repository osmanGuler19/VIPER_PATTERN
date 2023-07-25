//
//  UserRouter.swift
//  dummy_social-media
//
//  Created by Osman Güler on 8.05.2023.
//

import Foundation
import UIKit

protocol AnyUserRouter{
    static func createModule() -> UIViewController
    static func presentHomeScreen() -> Void
}

class  UserRouter : AnyUserRouter {
    
    static func createModule() -> UIViewController {
        let view = LoginView()
        let presenter: ViewToPresenterLoginProtocol & InteractorToPresenterLoginProtocol = LoginPresenter()
        let interactor: PresenterToInteractorProtocol = Interactor()
        let router: PresenterToRouterProtocol = Router()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    func presentHomeScreen() {
        let homeView = HomeView()
        viewController?.navigationController?.pushViewController(homeViewController, animated: true)
        NavigationLink(destination: homeView, isActive: $activated) {
            EmptyView()
        }
    }
    
}
