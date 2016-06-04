//
//  TimeView.swift
//  Tracking
//
//  Created by admin on 23.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit


let maxValueForTime = 100

@IBDesignable


class TimeView: UIView {
    
   
    @IBInspectable var counter: Float = 1
    @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
    @IBInspectable var counterColor: UIColor = UIColor.orangeColor()
    
    override func drawRect(rect: CGRect) {
        
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        let arcWidth: CGFloat = 25
        
        let startAngle: CGFloat = 0
        
        let endAngle: CGFloat = 6.28
        
        let path = UIBezierPath(arcCenter: center,radius: radius/2 - arcWidth ,startAngle: startAngle,endAngle: endAngle,clockwise: true)
        
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        let angleDifference: CGFloat = 2 * 3.14
        
        let arcLengthPerGlass = angleDifference / CGFloat(maxValueForTime)
        
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        let outlinePath = UIBezierPath(arcCenter: center,radius: radius/2 - 20.0,startAngle: startAngle,endAngle:outlineEndAngle,clockwise: true)
        
        outlinePath.addArcWithCenter(center,radius: radius/2 - arcWidth - 5,startAngle: outlineEndAngle,endAngle: startAngle,clockwise: false)
        
        outlinePath.closePath()
        outlineColor.setStroke()
        outlinePath.lineWidth = 15.0
        outlinePath.stroke()
    }
    
}
