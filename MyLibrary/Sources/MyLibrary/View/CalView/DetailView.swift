//
//  DetailView.swift
//  HTKLoanCaculator
//
//  Created by khiemht on 06/07/2021.
//

import SwiftUI
import UIKit

struct SumaryTextView: View {
    var body: some View {
//        Color.red.ignoresSafeArea()
//        Text("Detail Payment")
        HStack {
            SumaryVisualView().frame(width: 250, height: 250, alignment: .topLeading).position(x: 130, y: 180)
            VStack(alignment: .leading, spacing: 4, content: {
                Text("Paid off")
                Text("1000d")
                Text("Total interest")
                Text("1d")
                Text("Monthly paid")
                Text("20d")
            }).position(x: 100, y: 180)
        }.frame(width: .infinity, height: .infinity, alignment: .leading)
    }
}

//struct Detail_Preview: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
