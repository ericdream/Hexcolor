//
//  HexColor_swift.swift
//  Healthy
//
//  Created by develop on 7/1/15.
//  Copyright (c) 2015 Mac Mini. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    class func colorRromRGB(colorCode:String)->UIColor{
        var rgbVlaue:String = colorCode
        if rgbVlaue.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)<6 {
            return UIColor.whiteColor()
        }
        if rgbVlaue.hasPrefix("0x") {
            rgbVlaue = (rgbVlaue as NSString).substringFromIndex(2)
        }
        if rgbVlaue.hasPrefix("#"){
            rgbVlaue = (rgbVlaue as NSString).substringFromIndex(1)
        }
        if rgbVlaue.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) != 6
        {
            return UIColor.whiteColor()
        }
        var range = NSRange()
        range.location = 0
        range.length = 2
        var r:String = (rgbVlaue as NSString).substringWithRange(range)
        range.location = 2
        var g:String = (rgbVlaue as NSString).substringWithRange(range)
        range.location = 4
        var b:String = (rgbVlaue as NSString).substringWithRange(range)
        
        var scannerR = NSScanner(string: r)
        var colorR = UInt32()
        scannerR.scanHexInt(&colorR)
        var scannerG = NSScanner(string:g)
        var colorG = UInt32()
        scannerG.scanHexInt(&colorG)
        var scannerB = NSScanner(string: b)
        var colorB = UInt32()
        scannerB.scanHexInt(&colorB)
        
        return UIColor(red: CGFloat(Float(colorR) / 255.0), green: CGFloat(Float(colorG) / 255.0), blue: CGFloat(Float(colorB) / 255.0), alpha:1.0)
    }
}
 