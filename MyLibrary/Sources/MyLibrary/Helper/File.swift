//
//  File.swift
//  
//
//  Created by Khiem Huynh on 5/9/24.
//

import SwiftUI

struct ArcCircle: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width/2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        
        return path
    }
}
