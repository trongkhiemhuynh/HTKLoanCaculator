//
//  Extension.swift
//  HTKLoanCaculator
//
//  Created by khiemht on 07/07/2021.
//

import Foundation
import UIKit
import SwiftUI

extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct ArcCircle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width/2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        
        return path
    }
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    
}
