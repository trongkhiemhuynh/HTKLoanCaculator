//
//  CustomCircle.swift
//  HTKLoanCaculator
//
//  Created by khiemht on 08/07/2021.
//

import SwiftUI


struct CustomCircle: View {
    var body: some View {
        ArcCircle(startAngle: .degrees(90), endAngle: .degrees(180), clockwise: true).stroke(Color.blue, lineWidth: 20)
        ArcCircle(startAngle: .degrees(180), endAngle: .degrees(90), clockwise: true).stroke(Color.orange, lineWidth: 20)
    }
}

