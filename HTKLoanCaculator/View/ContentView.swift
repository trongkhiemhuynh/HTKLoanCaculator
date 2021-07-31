//
//  ContentView.swift
//  HTKLoanCaculator
//
//  Created by khiemht on 06/07/2021.
//

import SwiftUI
import IQKeyboardManagerSwift

struct ContentView: View {
    
    @State private var showDetail = false
    @ObservedObject var viewModel: HTKLoanCaculatorViewModel
    
    init() {
        viewModel = HTKLoanCaculatorViewModel()
    }
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20, content: {
                    
                    if !viewModel.totalPaid.isEmpty {
                        SumaryVisualView()
                    }
                    
                    Text("Loan amount").font(.title2).fontWeight(.bold)
                    
                    TextField("", text: $viewModel.loanAmount).textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: UIScreen.screenWidth - 20, height: 30, alignment: .leading).font(.title3)
                    
                    Text(viewModel.loanAmountError).foregroundColor(.red).font(.headline)
                    
                    HStack(alignment: .bottom, spacing: 10, content: {
                        Spacer()
                        
                        Button(".000") {
                            
                        }.foregroundColor(.black).font(.title3)
                    
                        Button(".000.000") {
                            
                        }.foregroundColor(.black).font(.title3)
                        
                        Button("clear") {
//                            loanAmount = ""
                        }.foregroundColor(.red).font(.title3)
                    })
                    
                    Text("Loan term").font(.title2).fontWeight(.bold)
                    
                    HStack(alignment: .center, spacing: 10, content: {
                        TextField("", text: $viewModel.term).textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: UIScreen.screenWidth - 200, height: 30, alignment: .leading).font(.title3)
                        
                        Picker(selection: $viewModel.loanTerm, label: Text("Time"), content: {
                            Text("Month").tag(0)
                            Text("Year").tag(1)
                            
                        }).pickerStyle(SegmentedPickerStyle())
                    })
                    
                    Text("Interest rate").font(.title2).fontWeight(.bold)
                    
                    HStack(content: {
                        TextField("", text: $viewModel.rate).textFieldStyle(RoundedBorderTextFieldStyle()).font(.title3).frame(width: UIScreen.screenWidth - 200, height: 30, alignment: .center)
                        
                        Text("%").font(.title2).fontWeight(.bold)
                    })
                    
                    HStack(content: {
                        
                        Text("Interest type").font(.title2).fontWeight(.bold)
                        
                        Button {
                            showDetail = true
                        } label: {
                            Image(systemName: "info.circle.fill")
                        }.sheet(isPresented: $showDetail, content: {
                            InterestInfoView(isPresent: $showDetail)
                        })
                        
                    })
                    
//                    Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/, content: {
//                        /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
//                        /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
//                    })
                    
//                    Picker(selection: $viewModel.loanMethod, label: Text("Method"), content: {
//                        Text("Flat rate method").tag(0)
//                        Text("Reduce balance method").tag(1)
//                        
//                    }).pickerStyle(SegmentedPickerStyle())
                    
                    // Detail
                    
                    
                    
                }).padding().navigationTitle("Loan Calulator").font(.largeTitle).navigationBarTitleDisplayMode(.automatic)
                
                NavigationLink("AMORTIZATION TABLE",destination: AmortizationTable()).frame(width: 200, height: 50, alignment: .center).background(Color.red).cornerRadius(10.0).foregroundColor(.black)

//            )
            
        }
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
