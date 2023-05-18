import Foundation
import UIKit

public func primaryButton(
    titleLabel: String,
    radius: CGFloat = 8,
    font: UIFont? = UIFont.robotoMedium(fontSize: 16),
    backgroundColor : UIColor? = UIColor(fromHex: "#1F8F2A")) -> UIButton
{
    let button = UIButton()
    button.setTitle(titleLabel, for: .normal)
    button.layer.cornerRadius = radius
    button.titleLabel?.font = font
    button.backgroundColor = backgroundColor
    
    return button
}


// Without the background Color
public func secondaryButton(
    titleLabel: String,
    radius: CGFloat = 8,
    font: UIFont? = UIFont.robotoMedium(fontSize: 14),
    titleColor : UIColor? = UIColor(fromHex: "#1F8F2A")) -> UIButton
{
    var button = UIButton()
     button.setTitle(titleLabel, for: .normal)
     button.titleLabel?.font = font
     button.setTitleColor(titleColor, for: .normal)
     button.backgroundColor = .none
     return button
}
