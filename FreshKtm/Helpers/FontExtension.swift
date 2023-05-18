import Foundation
import UIKit

extension UIFont {
    
    public static func robotoItalic(fontSize : CGFloat) -> UIFont? {
       return UIFont(name: "Roboto-Italic", size: fontSize)
    }
    
    public static func robotoLight(fontSize : CGFloat) -> UIFont? {
        return UIFont(name: "Roboto-Light", size: fontSize)
    }

    public static func robotoRegular(fontSize : CGFloat) -> UIFont? {
        return UIFont(name: "Roboto-Regular", size: fontSize)
    }
    
    public static func robotoMedium(fontSize : CGFloat) -> UIFont? {
       return UIFont(name: "Roboto-Medium", size: fontSize)
    }

    public static func robotoSemiBold(fontSize : CGFloat) -> UIFont? {
       return UIFont(name: "Roboto-Semibold", size: fontSize)
    }

    public static func robotoBold(fontSize : CGFloat) -> UIFont? {
       return UIFont(name: "Roboto-Bold", size: fontSize)
    }
    
}
