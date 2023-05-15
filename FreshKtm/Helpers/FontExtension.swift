import Foundation
import UIKit

extension UIFont {
    
    static func robotoItalic(fontSize : CGFloat) -> UIFont? {
       return UIFont(name: "Roboto-Italic", size: fontSize)
    }
    
    static func robotoLight(fontSize : CGFloat) -> UIFont? {
        return UIFont(name: "Roboto-Light", size: fontSize)
    }

    static func robotoRegular(fontSize : CGFloat) -> UIFont? {
        return UIFont(name: "Roboto-Regular", size: fontSize)
    }
    
    static func robotoMedium(fontSize : CGFloat) -> UIFont? {
       return UIFont(name: "Roboto-Medium", size: fontSize)
    }

    static func robotoSemiBold(fontSize : CGFloat) -> UIFont? {
       return UIFont(name: "Roboto-Semibold", size: fontSize)
    }

    static func robotoBold(fontSize : CGFloat) -> UIFont? {
       return UIFont(name: "Roboto-Bold", size: fontSize)
    }
    
}
