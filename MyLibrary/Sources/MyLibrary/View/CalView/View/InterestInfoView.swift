//
//  InterestInfoView.swift
//  HTKLoanCaculator
//
//  Created by khiemht on 06/07/2021.
//

import SwiftUI

struct InterestInfoView: View {

    let txtDetailLocalize: String
    
    var body: some View {
        Text(NSLocalizedString(txtDetailLocalize, comment: "")).padding(10)
    }
    
    
}
