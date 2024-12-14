//
//  CheckBoxView.swift
//  HTKApp Watch App
//
//  Created by Huynh Trong Khiem on 8/11/24.
//

import SwiftUI

struct CheckBoxView: View {
    var isChecked: Bool;
    
    var body: some View {
        Image(systemName: isChecked ? "checkmark.square.fill" : "square")
            .foregroundColor(isChecked ? Color.blue : Color.secondary)
    }
}

//#Preview {
//    CheckBoxView()
//}
