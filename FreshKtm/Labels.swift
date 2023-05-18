import Foundation
import UIKit

public func customLabel(
    title: String,
    size : CGFloat = 14,
    font: UIFont? = .robotoRegular(fontSize: 14),
    textColor : UIColor? = .gray) -> UILabel
{
    var label = UILabel()
    label.text = title
    label.textColor = textColor
    label.font = font
    
    return label
}
