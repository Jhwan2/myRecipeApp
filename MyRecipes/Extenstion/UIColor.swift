//
//  Color.swift
//  MyRecipes
//
//  Created by 주환 on 2023/08/31.
//

import Foundation
import UIKit

enum AssetsColor {
  // Primary Color
  case primaryBlack
  case primaryOrenge
  case primaryGray
  
  // SecondaryColor
  case secondaryGray1
  case secondaryGray2
  case secondaryGray3
}

extension UIColor {
  static func appColor(_ name: AssetsColor) -> UIColor {
    switch name {
    case .primaryBlack:
      return #colorLiteral(red: 0.1529411765, green: 0.1529411765, blue: 0.1529411765, alpha: 1)
    case .primaryOrenge:
      return #colorLiteral(red: 1, green: 0.4941176471, blue: 0.3333333333, alpha: 1)
    case .primaryGray:
      return #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
    case .secondaryGray1:
      return #colorLiteral(red: 0.5176470588, green: 0.5176470588, blue: 0.5176470588, alpha: 1)
    case .secondaryGray2:
      return #colorLiteral(red: 0.8235294118, green: 0.8117647059, blue: 0.8117647059, alpha: 1)
    case .secondaryGray3:
      return #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)
    }
  }
}

