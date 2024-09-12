//
//  CircleView.swift
//  HTKLoanCaculator
//
//  Created by khiemht on 06/07/2021.
//

import SwiftUI

let heightTextView: CGFloat = 31

struct SumaryVisualView: View {
    // MARK: properties biding
    var paidOffValue: String
    var totalInterestValue: String
    var monthlyPaidValue: String
    
    var percentageValue: Double {
        if let totalInt = totalInterestValue.formatFromCurrency(), let paidOff =  paidOffValue.formatFromCurrency() {
            return totalInt/paidOff*100
        }
        
        return 0.0
    }
    
    var originLoanBeginAngleDegree: Double {
        return -90
    }
    var originLoanEndAngleDegree: Double? {
        if let paidOff = paidOffValue.formatFromCurrency(), let totalInterest = totalInterestValue.formatFromCurrency() {
            return (totalInterest)/paidOff*360 + originLoanBeginAngleDegree
        }
        return nil
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 20, content: {
            if let originLoanEndAngleDegree = originLoanEndAngleDegree {
                GeometryReader(content: { geometry in
                    ArcCircle(startAngle: .degrees(originLoanBeginAngleDegree), endAngle: .degrees(originLoanEndAngleDegree), clockwise: false).stroke(Color.orange, lineWidth: 15)
                    ArcCircle(startAngle: .degrees(originLoanEndAngleDegree), endAngle: .degrees(originLoanBeginAngleDegree), clockwise: false).stroke(Color.blue, lineWidth: 15).overlay( Text("\(percentageValue.formatCurrency()) %").foregroundColor(.orange).font(.title2), alignment: .center)
                })
            }
            
            
            VStack(alignment: .leading, spacing: 2, content: {
                Text("Paid off")
                    .padding(4)
                    .frame(height: heightTextView, alignment: .leading)
                    .background(Color.blue)
                    .cornerRadius(4.0)
                    .font(.system(size: 16.0, weight: .regular, design: .rounded))
                    .foregroundColor(.white)
                
                Text("\(paidOffValue)")
                    .frame(height: heightTextView)
                    .cornerRadius(4.0)
                    .font(.system(size: 20.0, weight: .bold, design: .rounded))
                    .foregroundColor(.blue)
                
                Text("Total interest")
                    .padding(4)
                    .frame(height: heightTextView)
                    .background(Color.orange)
                    .cornerRadius(4.0)
                    .font(.system(size: 16.0, weight: .regular, design: .rounded))
                    .foregroundColor(.white)
                
                Text("\(totalInterestValue)")
                    .frame(height: heightTextView)
                    .cornerRadius(4.0)
                    .font(.system(size: 20.0, weight: .bold, design: .rounded))
                    .foregroundColor(.orange)
                
                Divider()
                
                Text("Monthly paid")
                    .frame(height: heightTextView)
                    .cornerRadius(4.0)
                    .font(.system(size: 16.0, weight: .regular, design: .rounded))
                    .foregroundColor(.black)
                
                Text("\(monthlyPaidValue)")
                    .frame(height: heightTextView)
                    .cornerRadius(4.0)
                    .font(.system(size: 20.0, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
            })
            
        }) .padding()
    }
}

//struct CircleView_Preview: PreviewProvider {
//    @State var poview: Double = 200
//    @State var tiv: Double = 20
//    @State var mpv: Double = 1
//    
//    static var previews: some View {
//        Group {
//            SumaryVisualView(paidOffValue: $pov, totalInterestValue: $tiv, monthlyPaidValue: $mpv)
//        }
//    }
//}

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

struct SumaryVisualView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SumaryVisualView(paidOffValue: "1000000000", totalInterestValue: "", monthlyPaidValue: "10000")
        }
    }
}
