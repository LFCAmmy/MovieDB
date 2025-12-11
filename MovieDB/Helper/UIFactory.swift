//
//  UIFactory.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//

import UIKit

open class UIFactory {
    
    public static func appLabel(text: String, font: UIFont, color: UIColor, lines: Int = 0, alignment: NSTextAlignment = .left) -> UILabel {
        
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color
        label.numberOfLines = lines
        label.textAlignment = alignment
        label.lineBreakMode = .byTruncatingTail
        
        return label
    }
    
    public static func attributedAppLabel(text: String, font: UIFont, color: UIColor, attributes: [(text: String, font: UIFont, color: UIColor)]) -> UILabel {
            
        let label = UILabel()
        
        let labelText = NSMutableAttributedString(string: text, attributes: [ .font: font, .foregroundColor: color ])
        
        attributes.forEach { (text: String, font: UIFont, color: UIColor) in
            labelText.addAttributes([.font: font, .foregroundColor: color ], range: (labelText.string as NSString).range(of: text))
        }

        label.attributedText = labelText
        return label
    }
    
    public static func getStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat = UIStackView.spacingUseDefault, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, subViews: [UIView] = []) -> UIStackView {
        
        let stackView = UIStackView(arrangedSubviews: subViews)
        
        stackView.axis = axis
        stackView.distribution = distribution
        stackView.spacing = spacing
        stackView.alignment = alignment
        
        return stackView
    }
    
    public static func getView(color: UIColor, radius: CGFloat = 0, clipsToBounds: Bool = false, withAlpha alphaValue: CGFloat = 1, height: CGFloat? = nil, width: CGFloat? = nil) -> UIView {
        let view = UIView()
        view.backgroundColor = color.withAlphaComponent(alphaValue)
        view.addCornerRadius(radius: radius)
        if let height { view.pinHeight(constant: height) }
        if let width { view.pinWidth(constant: width) }
        return view
    }
    
    public static func getImageView(image: UIImage? = nil, contentMode: UIView.ContentMode? = .scaleAspectFit, height: CGFloat? = nil, width: CGFloat? = nil, radius: CGFloat? = nil) -> UIImageView {
        let imageView = UIImageView()
        
        if let image = image { imageView.image = image }
        if let contentMode = contentMode { imageView.contentMode = contentMode }
        if let height = height { imageView.pinHeight(constant: height) }
        if let width = width { imageView.pinWidth(constant: width) }
        if let radius = radius { imageView.addCornerRadius(radius: radius) }
        
        return imageView
    }
    
}
