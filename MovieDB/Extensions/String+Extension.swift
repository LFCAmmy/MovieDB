//
//  String+Extension.swift
//  MovieDB
//
//  Created by Saurab Shrestha on 10/12/2025.
//

import Foundation
import UIKit

extension String {
    public func formattedURL() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
    
    func formatDate(fromFormat: SupportedDateFormat = .yyyyMMddDash, toFormat: SupportedDateFormat = .MMMMddcommayyyy) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = fromFormat.rawValue
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        guard let date = inputFormatter.date(from: self) else {
            return self // fallback if parsing fails
        }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = toFormat.rawValue
        outputFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        return outputFormatter.string(from: date)
    }
}

extension Int {
    func formatNumberToShort() -> String {
        if self >= 1_000_000_000 {
            let billions = Double(self) / 1_000_000_000
            return "\(roundToOneDecimal(billions))B"
        } else if self >= 1_000_000 {
            let millions = Double(self) / 1_000_000
            return "\(roundToOneDecimal(millions))M"
        } else if self >= 1_000 {
            let thousands = Double(self) / 1_000
            return "\(roundToOneDecimal(thousands))K"
        } else {
            return "\(self)"
        }
    }

    private func roundToOneDecimal(_ value: Double) -> String {
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(value))  // no decimal if whole number
        } else {
            return String(format: "%.1f", value)
        }
    }
    
    func minutesToHoursMinutes() -> String {
        let hours = self / 60
        let mins = self % 60
        
        if hours > 0 {
            return "\(hours)h \(mins)m"
        } else {
            return "\(mins)m"
        }
    }
}

extension UILabel {
    func setBoldNormalText(boldText: String, normalText: String, boldFont: UIFont, normalFont: UIFont, boldTextColor: UIColor, normalTextColor: UIColor) {
        let normalAttr = NSMutableAttributedString(
            string: normalText,
            attributes: [
                .font: normalFont,
                .foregroundColor: normalTextColor
            ]
        )
        
        let attributedText = NSAttributedString(
            string: boldText,
            attributes: [
                .font: boldFont,
                .foregroundColor: boldTextColor
            ]
        )
        
        normalAttr.append(attributedText)
        self.attributedText = normalAttr
    }
}
