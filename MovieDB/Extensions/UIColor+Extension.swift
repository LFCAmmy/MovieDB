//
//  UIColor+Extension.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 10/12/2025.
//

import UIKit

extension UIColor {
    //MARK: Background
    public static var background: UIColor { getColorByName("top_header") }
    public static var text: UIColor { getColorByName("primary_text") }
    public static var tint: UIColor { getColorByName("tint_text") }
    public static var cardBG: UIColor { getColorByName("card_bg") }
    public static var bodybg: UIColor { getColorByName("body_bg") }
    public static var errorLight: UIColor { getColorByName("color_error_light") }

        private static func getColorByName(_ colorName: String) -> UIColor {
            UIColor(named: colorName, in: Bundle.main, compatibleWith: nil)!
        }
}


