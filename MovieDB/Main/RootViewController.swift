//
//  RootViewController.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//

import UIKit

class RootViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.isOpaque = true
        
        setupDefaultNavigationBarAppearance()
        
        // Hide keyboard on view tap
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func setupDefaultNavigationBarAppearance() {
        let purpleColor = UIColor.background
        if #available(iOS 15.0, *) {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = purpleColor
                appearance.shadowColor = nil
                appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                navigationController?.navigationBar.standardAppearance = appearance
                navigationController?.navigationBar.scrollEdgeAppearance = appearance
            } else {
                navigationController?.navigationBar.barTintColor = purpleColor
                navigationController?.navigationBar.isTranslucent = false
                navigationController?.navigationBar.shadowImage = UIImage()
                navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            }

            self.navigationItem.hidesBackButton = true
            let newBackButton = UIBarButtonItem(image: UIImage(named: "ic_back")?.withRenderingMode(.alwaysTemplate),
                                                style: .plain,
                                                target: self,
                                                action: #selector(onBackButtonButtonTap))
            newBackButton.tintColor = .white
            self.navigationItem.leftBarButtonItem = newBackButton
            
            navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    func setupTransparentNavigationBar() {
        self.edgesForExtendedLayout = .all
        self.extendedLayoutIncludesOpaqueBars = true
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    func hideLeftBarButtonItemInNavigationItem() {
        if #available(iOS 16, *) {
            self.navigationItem.leftBarButtonItem?.isHidden = true
        } else {
            self.navigationItem.leftBarButtonItem?.isEnabled = false
            self.navigationItem.leftBarButtonItem?.tintColor = .clear
        }
    }
    
    @objc func onBackButtonButtonTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func hideKeyboard() {
        
        self.view.endEditing(true)
    }
    
    func showToastMessage(message : String, duration: Double = 3.0, buttonText: String? = nil, buttonAction: (() -> Void)? = nil) {
        
        let toastView = UIFactory.getView(color: .tint)
        toastView.setupForAutolayout(in: self.view)
        toastView.pinLeadingToLeading(of: self.view, constant: 16)
        toastView.pinTrailingToTrailing(of: self.view, constant: 16)
        toastView.pinBottomToBottomSafeArea(of: self.view, constant: 16)
        toastView.alpha = 1
        
        let toastLabel = UILabel()
        toastLabel.numberOfLines = 2
        toastLabel.font = .body2Regular
        toastLabel.textColor = .white
        toastLabel.text = message
        
        let stackView = UIFactory.getStackView(axis: .horizontal, spacing: 14, subViews: [toastLabel])
        
        stackView.setupForAutolayout(in: toastView)
        stackView.pin(left: 16, right: 16, top: 8, bottom: 8, toView: toastView)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            UIView.animate(withDuration: 0.3, animations: {
                toastView.alpha = 0
            }) { _ in
                toastView.removeFromSuperview()
            }
        }
    }
}
