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
    @Published var firstPayment: String =  ""
    
    @Published var loanAmountError: String = ""
    @Published var loanTermError: String = ""
    @Published var interestRateError: String = ""
    
    @Published var isShowButtonAmortization = false
    
    // free memory management
    private var disposeBag = Set<AnyCancellable>()
    // init
    
    
    init() {
        // check loan amount
//        if (self.loanAmount.isEmpty) {
//            loanAmountError = "loan amount not correct"
//        } else {
//            loanAmountError = ""
//        }
        
        let test = $loanAmount.map {
            ( $0.isEmpty) ? NSLocalizedString("txtErrorLoanAmount", comment: "") : ""
        }.assign(to: \.loanAmountError, on: self)
        
        test.store(in: &disposeBag)
//        Published.Publisher
        $term.map { number -> String in
            if (number.isEmpty) {
                return NSLocalizedString(NSLocalizedString("txtErrorLoanTerm", comment: ""), comment: "")
            }
            
            return ""
        }.assign(to: \.loanTermError, on: self).store(in: &disposeBag)
        
        
        
    }
    
    //tranform
    
    func transform() {
        
    }
    
}
