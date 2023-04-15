//
//  Typography.swift
//  ToDoList
//
//  Created by Gwinyai Nyatsoka on 4/4/2023.
//

import Foundation
import UIKit


//Custom font is handled here

//These provide two ways of getting the font type
extension UIFont {
    
    convenience init(type: FontType, size: FontSize) {
        self.init(name: type.name, size: size.value)!
    }
    
    static func style(_ style: FontStyle) -> UIFont {
        return style.font
    }
    
}

//Custom font types are listed here. Fonts can be found in Resources folder.
enum FontType: String {
    
    case assistantRegular = "Assistant-Regular"
    case assistantMedium = "Assistant-Medium"
    case assistantSemiBold = "Assistant-SemiBold"
    case assistantBold = "Assistant-Bold"
    
}

// Used to get string name of a font from FontType enumeration.
extension FontType {
    
    var name: String {
        return self.rawValue
    }
    
}

// Used to provide different ways of setting font size.
enum FontSize {
    case custom(Double)
    case theme(FontStyle)
    
}

// Helper variable to conveniently get font size
extension FontSize {
    var value: Double {
        switch self {
        case .custom(let customSize):
            return customSize
        case .theme(let size):
            return size.size
        }
    }
}

// Predefined custom font styles named according to function.
enum FontStyle {
    
    case h1
    case h2
    case body
    case secondaryText
    case caption
    case category
    case formLabel
    case buttonTitle
}

extension FontStyle {
    // Defines size of predefined font styles
    var size: Double {
        switch self {
        case .h1:
            return 22
        case .h2:
            return 18
        case .body:
            return 16
        case .secondaryText:
            return 14
        case .caption:
            return 13
        case .formLabel:
            return 14
        case .category:
            return 15
        case .buttonTitle:
            return 15
        }
    }
    // Defines font description of predefined font for accessibility
    private var fontDescription: FontDescription {
        switch self {
        case .h1:
            return FontDescription(font: .assistantBold, size: .theme(.h1), style: .title1)
        case .h2:
            return FontDescription(font: .assistantMedium, size: .theme(.h2), style: .title2)
        case .body:
            return FontDescription(font: .assistantRegular, size: .theme(.body), style: .body)
        case .secondaryText:
            return FontDescription(font: .assistantRegular, size: .theme(.secondaryText), style: .body)
        case .caption:
            return FontDescription(font: .assistantRegular, size: .theme(.caption), style: .caption1)
        case .category:
            return FontDescription(font: .assistantBold, size: .theme(.category), style: .body)
        case .formLabel:
            return FontDescription(font: .assistantSemiBold, size: .theme(.formLabel), style: .caption1)
        case .buttonTitle:
            return FontDescription(font: .assistantBold, size: .theme(.buttonTitle), style: .body)
        }
    }
    // Creates a predefined font with a dynamic font fallback
    var font: UIFont {
        guard let font = UIFont(name: fontDescription.font.name, size: fontDescription.size.value) else {
            return UIFont.preferredFont(forTextStyle: fontDescription.style)
        }
        let fontMetrics = UIFontMetrics(forTextStyle: fontDescription.style)
        return fontMetrics.scaledFont(for: font)
    }
    
}
// The properties needed to create a font description
private struct FontDescription {
    let font: FontType
    let size: FontSize
    let style: UIFont.TextStyle
}
