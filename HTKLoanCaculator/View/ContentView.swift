//
//  ContentView.swift
//  HTKLoanCaculator
//
//  Created by khiemht on 06/07/2021.
//

import SwiftUI

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
                    
                    Group {
                        Text("Loan amount").font(.title2).fontWeight(.bold)
                        
                        TextField("Ammount money loan", text: $viewModel.loanAmount).textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: UIScreen.screenWidth - 20, height: 30, alignment: .leading).font(.title3)
                        
                        Text(viewModel.loanAmountError).foregroundColor(.red).font(.headline)
                        
                        HStack(alignment: .bottom, spacing: 10, content: {
                            Spacer()
                            
                            Button(".000") {
                                viewModel.loanAmount += "000"
                            }.foregroundColor(.black).font(.title3)
                            
                            Button(".000.000") {
                                viewModel.loanAmount += "000000"
                            }.foregroundColor(.black).font(.title3)
                            
                            Button("clear") {
                                viewModel.loanAmount = ""
                            }.foregroundColor(.red).font(.title3)
                        })
                    }

                    Group {
                        Text("Loan term").font(.title2).fontWeight(.bold)
                        
                        HStack(alignment: .center, spacing: 10, content: {
                            TextField("How many time?", text: $viewModel.term).textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: UIScreen.screenWidth - 200, height: 30, alignment: .leading).font(.title3)
                            
                            Picker(selection: $viewModel.loanTerm, label: Text("Time"), content: {
                                Text("Month").tag(0)
                                Text("Year").tag(1)
                                
                            }).pickerStyle(SegmentedPickerStyle())
                        })

                        Text(viewModel.loanTermError).font(.headline).foregroundColor(.red)
                    }
                    
                    Group {
                        Text("Interest rate").font(.title2).fontWeight(.bold)
                        
                        HStack(content: {
                            TextField("", text: $viewModel.rate).textFieldStyle(RoundedBorderTextFieldStyle()).font(.title3).frame(width: UIScreen.screenWidth - 200, height: 30, alignment: .center)
                            
                            Text("%").font(.title2).fontWeight(.bold)
                        })
                        
                        Text(viewModel.interestRateError).font(.headline).foregroundColor(.red)
                    }
                    
                    Group {
                        HStack(content: {
                            
                            Text("Interest type").font(.title2).fontWeight(.bold)
                            
                            let strInfoLocalize = viewModel.loanMethod == 0 ? "txtFlatRateMethod" : "txtReduceBalanceMethod"
                            
                            NavigationLink(destination: InterestInfoView(txtDetailLocalize: strInfoLocalize)) {
                                
                                Image(systemName: "info.circle.fill").resizable().frame(width: 16, height: 16, alignment: .leading)
                                    .padding()
                            
                            }
                            
                        })
                        
                        Picker(selection: $viewModel.loanMethod, label: Text("Picker")) {
                            Text("Flat rate method").tag(0)
                            Text("Reduce balance method").tag(1)
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    
                    
                }).padding().navigationTitle("Loan Calulator").font(.largeTitle).navigationBarTitleDisplayMode(.automatic)
                
                NavigationLink(destination: AmortizationTable(), isActive: $viewModel.isShowButtonAmortization) {
                    Text("AMORTIZATION TABLE").padding().font(.bold(.title2)()).foregroundColor(.blue).background(Color(.systemPink))
                }
                
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
