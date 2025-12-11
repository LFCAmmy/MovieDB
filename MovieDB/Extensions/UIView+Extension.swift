//
//  UIView+Extension.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 09/12/2025.
//

import UIKit

extension UIView {
    
    class public var identifier: String {
        return String.init(describing: self)
    }
    
    public func setupForAutolayout(in view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
    }
    
    public func pinTrailingToTrailing(of view: UIView, constant: CGFloat) {
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant).isActive = true
    }
    
    public func pinTrailingToLeading(of view: UIView, constant: CGFloat) {
        self.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
    }
    
    public func pinTopToTopSafeArea(of view: UIView, constant: CGFloat) {
        
        if #available(iOS 11.0, *) {
            self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
        } else {
            self.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: constant).isActive = true
        }
    }
    
    public func pinTopToTop(of view: UIView, constant: CGFloat) {
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
    }
    
    public func pinTopToBottom(of view: UIView, constant: CGFloat) {
        self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true
    }
    
    public func pinLeadingToLeading(of view: UIView, constant: CGFloat) {
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
    }
    
    public func pinLeadingToTrailing(of view: UIView, constant: CGFloat) {
        self.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant).isActive = true
    }
    
    public func pinBottomToBottom(of view: UIView, constant: CGFloat) {
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant).isActive = true
    }
    
    public func pinBottomToBottomSafeArea(of view: UIView, constant: CGFloat) {
        
        if #available(iOS 11.0, *) {
            self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -constant).isActive = true
        } else {
            self.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -constant).isActive = true
        }
    }
    
    public func pinBottomToTop(of view: UIView, constant: CGFloat) {
        self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
    }
    
    public func pin(left: CGFloat, right: CGFloat, top: CGFloat, bottom: CGFloat, toView view: UIView) {
        
        self.pinLeadingToLeading(of: view, constant: left)
        self.pinTrailingToTrailing(of: view, constant: right)
        self.pinTopToTop(of: view, constant: top)
        self.pinBottomToBottom(of: view, constant: bottom)
    }
    
    public func pinEqualWidth(to view: UIView, constant: CGFloat = 0) {
        self.widthAnchor.constraint(equalTo: view.widthAnchor, constant: constant).isActive = true
    }
    
    public func pinWidth(constant: CGFloat) {
        self.widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    public func pinHeight(constant: CGFloat) {
        self.heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    public func pinToCenterHorizontally(in view: UIView, constant: CGFloat = 0) {
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
    }
    
    public func pinToCenterVertically(in view: UIView, constant: CGFloat = 0) {
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }
    
    public var boundsWidth: CGFloat {
        return self.bounds.width
    }
    
    public var boundsHeight: CGFloat {
        return self.bounds.height
    }
    
    public var frameWidth: CGFloat {
        return self.frame.width
    }
    
    public var frameHeight: CGFloat {
        return self.frame.height
    }
    
    public func addCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    public func addDropShadow() {
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
        self.clipsToBounds = false
    }
}

extension UITableView {
    
    func addPaginationIndicator(indicator: UIActivityIndicatorView) {
        
        indicator.hidesWhenStopped = true
        indicator.frame = CGRect(x: 0, y: 0, width: self.frameWidth, height: 40)
        self.tableFooterView = indicator
    }
    
    func showPaginationIndicator(indicator: UIActivityIndicatorView) {
        indicator.startAnimating()
    }
    
    func hidePaginationIndicator(indicator: UIActivityIndicatorView) {
        indicator.stopAnimating()
    }
    
    func dequeueCell<T: UITableViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        
        guard let cell = self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("UITableViewCell with identifier \(T.identifier) is not found. Make sure its registered first")
        }
        
        return cell
    }
}
