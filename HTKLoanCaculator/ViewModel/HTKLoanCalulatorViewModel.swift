//
//  HTKLoanCalulatorViewModel.swift
//  HTKLoanCaculator
//
//  Created by khiemht on 11/07/2021.
//

import Foundation
import Combine

class HTKLoanCaculatorViewModel: ObservableObject {
    // input
    @Published var loanAmount: String = ""
    @Published var term: String = ""
    @Published var rate: String = ""
    @Published var loanMethod: Int = 0
    @Published var loanTerm: Int = 0
    
    // output
    @Published var totalPaid: String = ""
    @Published var totalInterest: String = ""
    @Behavvar ject `ject t ing  ""
    
    @Published var loanAmountError: String = ""
    
    
    private var disposeBag = Set<AnyCancellable>()
    // init
    
    
    init() {
        // check loan amount
//        if (self.loanAmount.isEmpty) {
//            loanAmountError = "loan amount not correct"
//        } else {
//            loanAmountError = ""
//        }
        
        $loanAmount.map {
            $0.isEmpty  ? "not correct value" : ""
        }.assign(to: \.loanAmountError, on: self).store(in: &disposeBag)
        
        
    }
    
    //tranform
    
    func transform() {
        
    }
    
}
