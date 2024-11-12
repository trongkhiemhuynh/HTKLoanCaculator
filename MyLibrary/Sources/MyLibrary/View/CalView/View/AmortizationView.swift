//
//  AmortizationTable.swift
//  HTKLoanCaculator
//
//  Created by khiemht on 08/07/2021.
//

import SwiftUI

struct AmortizationView: View {
    
    let dataArray: [Int] = [1, 2, 3, 4, 5, 6,7,8,9,10,11,12]
    let dataArray1: [Int] = [1, 2, 3, 4, 5, 6,7,8,9,10,11,12]
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            MyHeader().zIndex(1.0).padding()
            Spacer()
            
            List {
                ForEach(dataArray + dataArray1, id: \.self) { element in
                    HStack {
                        Text("\(element)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.orange)
                        Text("1.000")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.orange)
                        Text("1.000.0000")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.orange)
                        Text("1.000.0000.0000.000.0000.0000")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.orange)
                    }
                }
            }
        }
    }
}

struct MyHeader: View {
    var body: some View {
        VStack {
            HStack {
                Text("Month").frame(minWidth: 10, maxWidth: .infinity, minHeight: 10, maxHeight: .infinity, alignment: .leading)
                Text("Principal").frame(minWidth: 10, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 10, maxHeight: .infinity, alignment: .leading)
                Text("Interest").frame(minWidth: 10, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Text("Repayment").frame(minWidth: 10, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }.background(Color.gray)
            
            MyBody()
        }.frame(height: 54)
        
    }
}

struct MyBody: View {
    var body: some View {
        Text("1 of 5 years").background(Color.gray)
    }
}

struct Amortizable_Previews: PreviewProvider {
    static var previews: some View {
        AmortizationView()
    }
}
