// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI
import UIKit


public struct HTKCalView: View {
    
    @State private var showDetail = false
    @ObservedObject var viewModel: HTKLoanCalViewModel
    @State private var showingPopover = false
    
    public init() {
        viewModel = HTKLoanCalViewModel()
    }
    
    public var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 4, content: {
                    if !viewModel.totalPaid.isEmpty {
                        SumaryVisualView()
                    }
                    
                    Group {
                        Text("Loan amount").font(.title3).fontWeight(.regular)
                        
                        TextField("", text: $viewModel.loanAmount).textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .font(.title3)
                        
                        // Promt error message loan amount
                        Text(viewModel.loanAmountError).foregroundColor(.orange).font(.footnote)
                        
                        HStack(alignment: .bottom, spacing: 10, content: {
                            Spacer()
                            
                            Button(".000") {
                                viewModel.loanAmount += "000"
                            }.foregroundColor(.gray).font(.callout)
                            
                            Button(".000.000") {
                                viewModel.loanAmount += "000000"
                            }.foregroundColor(.gray).font(.callout)
                            
                            Button("clear") {
                                viewModel.loanAmount = ""
                            }.foregroundColor(.gray).font(.callout)
                        })
                    }

                    Group {
                        Text("Loan term").font(.title3).fontWeight(.regular)
                        
                        HStack(alignment: .center, spacing: 10, content: {
                            TextField("", text: $viewModel.term).textFieldStyle(RoundedBorderTextFieldStyle())/*.frame(width: .infinity - 200, height: 30, alignment: .leading)*/
                                .font(.title3)
                                .frame(minWidth: 10, maxWidth: .infinity - 200, minHeight: 10, maxHeight: 30)
                            
                            Picker(selection: $viewModel.loanTerm, 
                                   label: Text("Time"), content: {
                                Text("Month").tag(0)
                                Text("Year").tag(1)
                                
                            }).pickerStyle(SegmentedPickerStyle())
                        })

                        Text(viewModel.loanTermError).font(.footnote).foregroundColor(.orange)
                    }
                    
                    Group {
                        Text("Interest rate").font(.title3).fontWeight(.regular)
                        
                        HStack(content: {
                            TextField("", text: $viewModel.rate).textFieldStyle(RoundedBorderTextFieldStyle()).font(.title3)
                                .frame(minWidth: 1,
                                       maxWidth: 200,
                                       minHeight: 1,
                                       maxHeight: 30)
                            
                            Text("%").font(.headline).fontWeight(.regular)
                        })
                        
                        Text(viewModel.interestRateError).font(.footnote).foregroundColor(.orange)
                    }
                    
                    Group {
                        HStack(content: {
                            Text("Interest type").font(.title3).fontWeight(.regular)
                            
                            let strInfoLocalize = viewModel.loanMethod == 0 ? NSLocalizedString("txtFlatRateMethod", comment: "flat_rate") :
                            NSLocalizedString("txtReduceBalanceMethod", comment: "reduce_rate")
                            
                            Button("", systemImage: "info.circle.fill") {
                                showingPopover = true
                            }
                            .popover(isPresented: $showingPopover, content: {
                                InterestInfoView(txtDetailLocalize: strInfoLocalize)
                            })
                        })
                        
                        Picker(selection: $viewModel.loanMethod, label: Text("Picker")) {
                            Text("Flat rate method").tag(0)
                            Text("Reduce balance method").tag(1)
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                })
                .padding()
                .navigationTitle("Loan Calulator")
                .font(.largeTitle)
                .navigationBarTitleDisplayMode(.automatic)
                
                Spacer().frame(height: 100)
                
                NavigationLink(destination: AmortizationView(),
                               isActive: $viewModel.isShowButtonAmortization) {
                    
                    Text("AMORTIZATION TABLE")

                        .font(.title2)
                        .foregroundColor(.white)
                        .background(Color.blue)

                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HTKCalView()
        }
    }
}
