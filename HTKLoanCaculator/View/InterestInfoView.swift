//
//  InterestInfoView.swift
//  HTKLoanCaculator
//
//  Created by khiemht on 06/07/2021.
//

import SwiftUI

struct InterestInfoView: View {
    
    @Binding var isPresent: Bool
    
    var body: some View {
        
        Text("Interest Rate Info View")
        Button("Dismiss") {
            isPresent = false
        }.padding()
    }
    
    
}

