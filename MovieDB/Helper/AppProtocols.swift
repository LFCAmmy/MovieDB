//
//  AppProtocols.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//

import UIKit
import SwiftyJSON

protocol LoadingIndicatorPresentable {
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
}

protocol ApiRequestPresentable: AnyObject, LoadingIndicatorPresentable {
    func displayError(error: NetworkError)
    func displaySuccessMessage(_ message: String)
}

extension ApiRequestPresentable {
    
    func showLoadingIndicator() {
        LoadingIndicatorView.show()
    }
    
    func hideLoadingIndicator() {
        LoadingIndicatorView.hide()
    }
    
    func displayError(error: NetworkError) {
//        ToastNotification.show(message: error.localizedDescription, type: .error)
    }
    
    func displaySuccessMessage(_ message: String) {
//        ToastNotification.show(message: message, type: .success)
    }
    
    func displayErrorMessage(_ message: String) {
//        ToastNotification.show(message: message, type: .error)
    }
    
    func displayError(using error: Error) {
//        if let appError = error as? NetworkError {
//            ToastNotification.show(message: appError.errorMessage ?? UnknownError.default.localizedDescription, type: .error)
//        } else {
//            ToastNotification.show(message: UnknownError.default.localizedDescription, type: .error)
//        }
    }
}
