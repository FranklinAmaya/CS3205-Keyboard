//
//  RoundButton.swift
//  CustomKeyboard
//
//  Created by Franklin Amaya on 6/5/18.
//  Copyright © 2018 Franklin Amaya. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    //Corner Radius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    //Shadow Color
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet{
            self.layer.shadowColor = shadowColor.cgColor
        }
    }

    //Shadow Offset
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 2.0) {
        didSet{
            self.layer.shadowOffset = shadowOffset
        }
    }
    
    //Shadow Opacity
    @IBInspectable var shadowOpacity: CGFloat = 0 {
        didSet{
            self.layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    //Shadow
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet{
            self.layer.shadowRadius = shadowRadius
        }
    }
}
