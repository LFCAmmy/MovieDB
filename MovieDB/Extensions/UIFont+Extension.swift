//
//  UIFont+Extension.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 11/12/2025.
//

import Foundation
import UIKit

extension UIFont {
    
    static func font(_ font: Font, ofSize size: CGFloat) -> UIFont {
        guard let requiredFont = UIFont(name: font.fontName(), size: size) else {
            fatalError("Please check that the font is properly added to the app")
        }
        return requiredFont
    }
    
    /// Weight of the font
    enum Font {
        case bold
        case regular
        case medium
        case light
        case italic
        case semiBold
        case semiBoldItalic
        case mediumItalic
        
        /// Method to get the name of the font with the given weight
        /// - Parameter font: the font whose name we will get
        func fontName() -> String {
            switch self {
            case .bold:
                return "Asap-Bold"
            case .regular:
                return "Asap-Regular"
            case .medium:
                return "Asap-Medium"
            case .light:
                return "Asap-Light"
            case .italic:
                return "Asap-Italic"
            case .semiBold:
                return "Asap-SemiBold"
            case .semiBoldItalic:
                return "Asap-SemiBoldItalic"
            case .mediumItalic:
                return "Asap-MediumItalic"
            }
        }
    }
}

extension UIFont {
    
    public static let h1Regular = UIFont.font(.regular, ofSize: 48)
    public static let h2Regular = UIFont.font(.regular, ofSize: 34)
    public static let h3Regular = UIFont.font(.regular, ofSize: 24)
    public static let h4Regular = UIFont.font(.regular, ofSize: 20)
    public static let h5Regular = UIFont.font(.regular, ofSize: 16)
    public static let h6Regular = UIFont.font(.regular, ofSize: 14)
    public static let h7Regular = UIFont.font(.regular, ofSize: 12)
    
    public static let h1RegularItalic = UIFont.font(.italic, ofSize: 48)
    public static let h2RegularItalic = UIFont.font(.italic, ofSize: 34)
    public static let h3RegularItalic = UIFont.font(.italic, ofSize: 24)
    public static let h4RegularItalic = UIFont.font(.italic, ofSize: 20)
    public static let h5RegularItalic = UIFont.font(.italic, ofSize: 16)
    public static let h6RegularItalic = UIFont.font(.italic, ofSize: 14)
    
    public static let h1Medium = UIFont.font(.medium, ofSize: 48)
    public static let h2Medium = UIFont.font(.medium, ofSize: 34)
    public static let h3Medium = UIFont.font(.medium, ofSize: 24)
    public static let h4Medium = UIFont.font(.medium, ofSize: 20)
    public static let h5Medium = UIFont.font(.medium, ofSize: 16)
    public static let h6Medium = UIFont.font(.medium, ofSize: 14)
    
    public static let h1SemiBold = UIFont.font(.semiBold, ofSize: 48)
    public static let h2SemiBold = UIFont.font(.semiBold, ofSize: 34)
    public static let h3SemiBold = UIFont.font(.semiBold, ofSize: 24)
    public static let h4SemiBold = UIFont.font(.semiBold, ofSize: 20)
    public static let h5SemiBold = UIFont.font(.semiBold, ofSize: 16)
    public static let h6SemiBold = UIFont.font(.semiBold, ofSize: 14)
    
    public static let h1Bold = UIFont.font(.bold, ofSize: 48)
    public static let h2Bold = UIFont.font(.bold, ofSize: 34)
    public static let h3Bold = UIFont.font(.bold, ofSize: 24)
    public static let h4Bold = UIFont.font(.bold, ofSize: 20)
    public static let h5Bold = UIFont.font(.bold, ofSize: 16)
    public static let h6Bold = UIFont.font(.bold, ofSize: 14)
    
    public static let bodyRegular = UIFont.font(.regular, ofSize: 16)
    public static let body2Regular = UIFont.font(.regular, ofSize: 14)
    
    public static let bodyRegularItalic = UIFont.font(.italic, ofSize: 16)
    public static let body2RegularItalic = UIFont.font(.italic, ofSize: 14)
    
    public static let bodyMedium = UIFont.font(.medium, ofSize: 16)
    public static let body2Medium = UIFont.font(.medium, ofSize: 14)
    
    public static let bodySemiBold = UIFont.font(.semiBold, ofSize: 16)
    public static let body2SemiBold = UIFont.font(.semiBold, ofSize: 14)
    
    public static let bodyBold = UIFont.font(.bold, ofSize: 16)
    public static let body2Bold = UIFont.font(.bold, ofSize: 14)
    
    public static let buttonMedium = UIFont.font(.medium, ofSize: 14)
    public static let buttonMediumItalic = UIFont.font(.mediumItalic, ofSize: 14)
    
    public static let labelRegular = UIFont.font(.regular, ofSize: 12)
    public static let labelMedium = UIFont.font(.medium, ofSize: 12)
    public static let labelMediumItalic = UIFont.font(.mediumItalic, ofSize: 12)
    
    public static let captionRegular = UIFont.font(.regular, ofSize: 12)
    public static let captionRegularItalic = UIFont.font(.italic, ofSize: 12)
    public static let captionMedium = UIFont.font(.medium, ofSize: 12)
    public static let captionSemiBold = UIFont.font(.semiBold, ofSize: 12)
    public static let captionBold = UIFont.font(.bold, ofSize: 12)
    
    public static let overLineRegular = UIFont.font(.regular, ofSize: 12)
    public static let overLineRegularItalic = UIFont.font(.italic, ofSize: 12)
    public static let overLineMedium = UIFont.font(.medium, ofSize: 12)
    public static let overLineSemiBold = UIFont.font(.semiBold, ofSize: 12)
    public static let overLineBold = UIFont.font(.bold, ofSize: 12)
    
    public static let overLine2Regular = UIFont.font(.regular, ofSize: 10)
    public static let overLine2RegularItalic = UIFont.font(.italic, ofSize: 10)
    public static let overLine2Medium = UIFont.font(.medium, ofSize: 10)
    public static let overLine2SemiBold = UIFont.font(.semiBold, ofSize: 10)
    public static let overLine2Bold = UIFont.font(.bold, ofSize: 10)
    
    public static let subCaptionRegular = UIFont.font(.regular, ofSize: 10)
    public static let subCaptionRegularItalic = UIFont.font(.italic, ofSize: 10)
    public static let subCaptionMedium = UIFont.font(.medium, ofSize: 10)
    public static let subCaptionSemiBold = UIFont.font(.semiBold, ofSize: 10)
    public static let subCaptionBold = UIFont.font(.bold, ofSize: 10)
    
    public static let subCaption2Regular = UIFont.font(.regular, ofSize: 8)
    public static let subCaption2RegularItalic = UIFont.font(.italic, ofSize: 8)
    public static let subCaption2Medium = UIFont.font(.medium, ofSize: 8)
    public static let subCaption2SemiBold = UIFont.font(.semiBold, ofSize: 8)
    public static let subCaption2Bold = UIFont.font(.bold, ofSize: 8)
    
}
