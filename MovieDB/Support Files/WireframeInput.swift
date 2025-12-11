//
//  WireframeInput.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 10/12/2025.
//
//

import UIKit

protocol WireframeInput {
    var window: UIWindow? {get}
    var view: UIViewController! {get}
    func openMainView(source: UIViewController)
    func pushMainView(on source: UIViewController)
    func pushMainView(in source: UINavigationController)
    func getMainView(_ data: Any?) -> UIViewController
    func openMainViewIn(window: UIWindow)
    func openViewControllerWithNavigation(viewController: UIViewController, source: UIViewController)
}

extension WireframeInput {
    var window: UIWindow? {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            return sceneDelegate.window
        }
        return nil
    }
    
    func viewControllerFromCode<T: UIViewController>(of type: T.Type) -> T {
        return T.init()
    }
    
    func openMainViewIn(window: UIWindow) {
        let view = self.getMainView(nil)
        window.rootViewController = view
    }
    
    func openMainViewAsNavigationControllerIn(window: UIWindow) {
        let view = self.getMainView(nil)
        let nav = UINavigationController.init(rootViewController: view)
        window.rootViewController = nav
    }
    
    func openMainView(source: UIViewController) {
        let mainView = self.getMainView(nil)
        mainView.modalPresentationStyle = .fullScreen
        source.present(mainView, animated: true, completion: nil)
    }
    
    func pushMainView(on source: UIViewController) {
        guard let nav = view.navigationController else { return }
        nav.pushViewController(source, animated: true)
    }
    
    func pushMainView(in source: UINavigationController) {
        let mainView = self.getMainView(nil)
        source.pushViewController(mainView, animated: true)
    }
    
    func openViewControllerWithNavigation(viewController: UIViewController, source: UIViewController) {
        let nav = UINavigationController(rootViewController: viewController)
        nav.modalPresentationStyle = .fullScreen
        source.present(nav, animated: true, completion: nil)
    }
    
    func openViewControllerWithNavigationOverFullScreen(viewController: UIViewController, source: UIViewController) {
        let nav = UINavigationController(rootViewController: viewController)
        nav.modalPresentationStyle = .overFullScreen
        source.present(nav, animated: false, completion: nil)
    }
    
}
