//
//  InterestInfoView.swift
//  HTKLoanCaculator
//
//  Created by khiemht on 06/07/2021.
//

import SwiftUI

struct InterestInfoView: View {
    
//    @Binding var isPresent: Bool
    let txtDetailLocalize: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text(NSLocalizedString(txtDetailLocalize, comment: ""))
            Spacer()
        }
        
        .navigationTitle("Information Interest Rate")
    }
    
    
}

