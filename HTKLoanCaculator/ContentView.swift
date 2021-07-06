//
//  ContentView.swift
//  HTKLoanCaculator
//
//  Created by khiemht on 06/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var loanAmount = ""
    @State private var term = ""
    @State private var interestType = 1
    @State private var loanTermPicker = 1
    
    var body: some View {
        
        NavigationView {
//            Text("Loan Caculator").font(.largeTitle)
            
            VStack(alignment: .leading, spacing: 10, content: {
                Text("Loan amount")
                TextField("1.000.0000 USD", text: $loanAmount).textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Loan term")
                
                HStack(alignment: .center, spacing: 10, content: {
                    TextField("", text: $term).textFieldStyle(RoundedBorderTextFieldStyle())
                    Picker(selection: $loanTermPicker, label: Text("Time"), content: {
                        Text("Month").tag(1)
                        Text("Year").tag(2)
                        
                    }).pickerStyle(SegmentedPickerStyle())
                })
                
                Text("Interest rate")
                
                HStack(content: {
                    TextField("", text: $term).textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("%")
                })
                
                Text("Interest type")
                
                Picker(selection: $interestType, label: Text("Method"), content: {
                    Text("Flat rate method").tag(1)
                    Text("Reduce balance method").tag(2)
                    
                }).pickerStyle(SegmentedPickerStyle())
    
            }).frame(width: 300, height: 300, alignment: .topLeading).navigationTitle("Loan Calulator").font(.largeTitle).navigationBarTitleDisplayMode(.automatic)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
