//
//  UIFont.swift
//  MyRecipes
//
//  Created by 주환 on 2023/08/31.
//

import Foundation
import UIKit

extension UIFont {
    class func MaruBuri(type: MaruBuriType, size: CGFloat) -> UIFont! {
        guard let font = UIFont(name: type.name, size: size) else {
            return nil
        }
        return font
    }

    public enum MaruBuriType {
        case Bold
        case SemiBold
        case Light
        case Regular
        case ExtraLight

        var name: String {
            switch self {
            case .ExtraLight:
                return "MaruBuri-ExtraLight"
            case .Bold:
                return "MaruBuri-Bold"
            case .Light:
                return "MaruBuri-Light"
            case .Regular:
                return "MaruBuri-Regular"
            case .SemiBold:
                return "MaruBuri-SemiBold"

            }
        }
    }
}
