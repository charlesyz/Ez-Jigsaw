//
//  Extensions.swift
//  Puzzle Jigsaw
//
//  Created by Charles Zhang on 2017-07-12.
//  Copyright © 2017 Charles Zhang. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

extension UIColor{
    func HexToColor(hexString: String, alpha:CGFloat? = 1.0) -> UIColor {
        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha = alpha!
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    func intFromHexString(hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = NSCharacterSet(charactersIn: "#") as CharacterSet
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
}

/*extension SKSpriteNode {
    func bringToFront() {
        guard let parent = parent else {
            print("No Parent")
            return
        }
        self.removeFromParent()
        parent.addChild(self)
    }
}*/
