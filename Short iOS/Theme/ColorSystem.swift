//
//  ColorSystem.swift
//  Short iOS
//
//  Created by 진세진 on 2023/11/24.
//
import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        assert(alpha >= 0.0 && alpha <= 1.0, "Invalid alpha component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    convenience init(rgb: Int, alpha: CGFloat) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            alpha: alpha
        )
    }
    // MARK: - 디자인 시스템 컬러 지정
    static var background: UIColor {
        return UIColor(rgb: 0xffF4F1EF, alpha: 1.0)
    }
    
    static var primary: UIColor {
        return UIColor(rgb: 0xffF35E3E, alpha: 1.0)
    }
    
    static var secondary: UIColor {
        return UIColor(rgb: 0xff239F95, alpha: 1.0)
    }
    
    static var textBlack: UIColor {
        return UIColor(rgb: 0xff2B2B2B, alpha: 1.0)
    }
    
    static var textBlackT: UIColor {
        return UIColor(rgb: 0xff2B2B2B, alpha: 0.5)
    }
    
    static var hoverBlue: UIColor {
        return UIColor(rgb: 0xffF4F1EF, alpha: 1.0)
    }
    
    static var white: UIColor {
        return UIColor(rgb: 0xffFFFFFF, alpha: 1.0)
    }
    
    static var K200: UIColor {
        return UIColor(rgb: 0xff141316, alpha: 1.0)
    }
    
    static var dark_200K: UIColor {
        return UIColor(rgb: 0xff000000, alpha: 1.0)
    }
    
    static var k400: UIColor {
        return UIColor(rgb: 0xff19DB77, alpha: 1.0)
    }
    
    static var dark_400K: UIColor {
        return UIColor(rgb: 0xff04B158, alpha: 1.0)
    }
    
    static var K600: UIColor {
        return UIColor(rgb: 0xffEED542, alpha: 1.0)
    }
    
    static var dark_K600: UIColor {
        return UIColor(rgb: 0xffBDA82C, alpha: 1.0)
    }
    
    static var K800: UIColor {
        return UIColor(rgb: 0xff0784EC, alpha: 1.0)
    }
    
    static var dark_K800: UIColor {
        return UIColor(rgb: 0xff1964A2, alpha: 1.0)
    }
    
    static var M1: UIColor {
        return UIColor(rgb: 0xffF03A40, alpha: 1.0)
    }
    
    static var dark_M1: UIColor {
        return UIColor(rgb: 0xff0784EC, alpha: 1.0)
    }
    
    static var category : UIColor{
        return UIColor(rgb: 0x2B2B2B, alpha: 1.0)
    }
    static var backgrounColor : UIColor{
        return UIColor(rgb: 0xF4F1EF, alpha: 1.0)
    }
    static var buttonOrange : UIColor{
        return UIColor(rgb: 0xF35E3E, alpha: 1.0)
    }
}
