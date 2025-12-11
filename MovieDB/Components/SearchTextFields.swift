//
//  SearchTextFields.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 10/12/2025.
//

import Foundation
import UIKit

open class SearchTextFields: UITextField {
    
    public let lineLayer = CAShapeLayer()
    public var lineThickness: CGFloat = 1
    
    public var searchImageView: UIImageView!
    
    public var closeImageView: UIImageView!
        
    public var leftPadding: CGFloat = 35
    public var rightPadding: CGFloat = 35
    public var topPadding: CGFloat = 0
    public var bottomPadding: CGFloat = 0
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        
        let padding = UIEdgeInsets(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding)
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        
        let padding = UIEdgeInsets(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding)
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        let padding = UIEdgeInsets(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding)
        return bounds.inset(by: padding)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSearchField()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupSearchField()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        lineLayer.frame = CGRect(x: 0, y: self.boundsHeight - lineThickness, width: self.boundsWidth, height: lineThickness)
    }
    
    func setupSearchField() {
        
        searchImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        searchImageView.image = UIImage(named: "ic_nav_search")?.withRenderingMode(.alwaysTemplate)
        searchImageView.contentMode = .scaleAspectFit
        self.clearButtonMode = .whileEditing
        
        self.leftView = searchImageView
        self.leftViewMode = .always
        
        closeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        closeImageView.image = UIImage(named: "ic_back")?.withRenderingMode(.alwaysTemplate)
        closeImageView.contentMode = .scaleAspectFit
        
        self.rightView = closeImageView
        self.rightView?.isHidden = true
        
        self.placeholder = "Search"
        
        self.borderStyle = .none
        self.lineLayer.frame = CGRect(x: 0, y: self.boundsHeight - lineThickness, width: self.boundsWidth, height: lineThickness)
        self.lineLayer.backgroundColor = UIColor.bodyBg.cgColor
        
        self.layer.addSublayer(lineLayer)
        self.textColor = .text
        self.font = .bodyRegular
    }
}

