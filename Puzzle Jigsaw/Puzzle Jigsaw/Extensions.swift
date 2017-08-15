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


extension UIImage {
    class func image(from layer: CALayer) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(layer.bounds.size,
                                               layer.isOpaque, UIScreen.main.scale)
        
        // Don't proceed unless we have context
        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}

extension UIImage {
    /*func getPixelColor(point: CGPoint) -> UIColor {
        
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(point.y)) + Int(point.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
        
    }*/
    func getPixelColor(point: CGPoint) -> UIColor {
        let cgImage = self.cgImage
        
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let alphaInfo = cgImage!.alphaInfo
        assert(alphaInfo == .premultipliedFirst || alphaInfo == .first || alphaInfo == .noneSkipFirst, "This routine expects alpha to be first component")
        
        let byteOrder = cgImage!.bitmapInfo.rawValue & CGBitmapInfo.byteOrderMask.rawValue
        assert(byteOrder == CGBitmapInfo.byteOrder32Little.rawValue, "This routine expects little-endian 32bit format")
        
        let bytesPerRow = cgImage!.bytesPerRow
        let pixelInfo = Int(point.y) * bytesPerRow + Int(point.x) * 4;
        
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        let r = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo  ]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    func getPixelAlpha(pos: CGPoint) -> CGFloat {
        
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let alphaInfo = cgImage!.alphaInfo
        assert(alphaInfo == .premultipliedFirst || alphaInfo == .first || alphaInfo == .noneSkipFirst, "This routine expects alpha to be first component")
        
        let byteOrder = cgImage!.bitmapInfo.rawValue & CGBitmapInfo.byteOrderMask.rawValue
        assert(byteOrder == CGBitmapInfo.byteOrder32Little.rawValue, "This routine expects little-endian 32bit format")
        
        let bytesPerRow = cgImage!.bytesPerRow
        let pixelInfo = Int(pos.y) * bytesPerRow + Int(pos.x) * 4;
        
        return CGFloat(data[pixelInfo+3]) / CGFloat(255.0)

    }
    
}

public extension UIImage {
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}

extension CGFloat {
    func round(nearest: CGFloat) -> CGFloat {
        let n = 1/nearest
        let numberToRound = self * n
        return numberToRound.rounded() / n
    }
    
    func floor(nearest: CGFloat) -> CGFloat {
        let intDiv = CGFloat(Int(self / nearest))
        return intDiv * nearest
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
