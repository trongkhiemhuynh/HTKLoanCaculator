//
//  CircleView.swift
//  HTKLoanCaculator
//
//  Created by khiemht on 06/07/2021.
//

import SwiftUI

let heightTextView: CGFloat = 31

struct SumaryVisualView: View {
    
    var body: some View {
        HStack(alignment: .center, spacing: 20, content: {
            
//            Circle()
//                .stroke(lineWidth: 20.0)
//                .foregroundColor(.orange)
            
            GeometryReader(content: { geometry in
                ArcCircle(startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false).stroke(Color.blue, lineWidth: 20)
                ArcCircle(startAngle: .degrees(180), endAngle: .degrees(90), clockwise: false).stroke(Color.orange, lineWidth: 20).overlay( Text("1234").foregroundColor(.orange).font(.subheadline), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
               
            })
//            CustomCircle()
            
            VStack(alignment: .leading, spacing: 2, content: {
                Text("Paid off")
                    .padding()
                    .frame(height: heightTextView)
                    .background(Color.red)
                    .cornerRadius(8.0)
                    .font(.system(size: 11.0, weight: .bold, design: .serif))
                Text("")
                    .padding()
                    .frame(height: heightTextView)
                    .background(Color.red)
                    .cornerRadius(8.0)
                    .font(.system(size: 10.0, weight: .regular, design: .serif))
                Text("Total interest")
                    .padding()
                    .frame(height: heightTextView)
                    .background(Color.red)
                    .cornerRadius(8.0)
                    .font(.system(size: 11.0, weight: .bold, design: .serif))
                Text("")
                    .padding()
                    .frame(height: heightTextView)
                    .background(Color.red)
                    .cornerRadius(8.0)
                    .font(.system(size: 10.0, weight: .regular, design: .serif))
                
                Divider()
                
                Text("Monthly paid")
                    .padding()
                    .frame(height: heightTextView)
                    .background(Color.red)
                    .cornerRadius(8.0)
                    .font(.system(size: 11.0, weight: .bold, design: .serif))
                Text("")
                    .padding()
                    .frame(height: heightTextView)
                    .background(Color.red)
                    .cornerRadius(8.0)
                    .font(.system(size: 10.0, weight: .regular, design: .serif))
            })
            
        }) .padding()
    }
}

struct CircleView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            SumaryVisualView()
        }
    }
}
