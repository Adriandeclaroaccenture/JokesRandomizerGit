//
//  AppConstant.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 1/5/23.
//

import Foundation
import UIKit

struct Design {
    struct Color {
        struct Primary{
            static let blue_color = UIColor.rgba(red: 0, green: 122, blue: 255, alpha: 1)
            static let black_color = UIColor.rgba(red: 21, green: 23, blue: 33, alpha: 1)
        }
    }
    struct Font {
        static let font_body = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
    struct Image {
        static let refresh_image = UIImage(systemName: "arrow.clockwise.circle.fill")
        static let add_image = UIImage(systemName: "plus")
        static let list_image = UIImage(systemName: "list.bullet.circle")
    }
}

extension UIColor {
    static func rgba(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    class var default_blue:UIColor {
       return UIColor(red: 0/255.0, green: 122/255.0, blue: 255/255.0, alpha: 1.0)
     }
}
