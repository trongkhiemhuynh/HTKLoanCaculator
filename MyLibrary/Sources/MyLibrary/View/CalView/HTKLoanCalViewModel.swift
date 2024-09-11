//
//  HTKLoanCalulatorViewModel.swift
//  HTKLoanCaculator
//
//  Created by khiemht on 11/07/2021.
//

import Foundation
import Combine

class HTKLoanCalViewModel: ObservableObject {
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
    
    private var disposeBag = Set<AnyCancellable>()

    init() {
        $loanAmount.map { item in
            if item.count == 0 {return ""}
            if let int = Int(item), int > 0 {
                return ""
            }
            return NSLocalizedString("txtErrorLoanAmount", comment: "")
        }.assign(to: \.loanAmountError, on: self).store(in: &disposeBag)

        $term.map { item in
            if item.count == 0 {return ""}
            if let int = Int(item), int > 0 {
                return ""
            }
            return NSLocalizedString(NSLocalizedString("txtErrorLoanTerm", comment: ""), comment: "")
        }.assign(to: \.loanTermError, on: self).store(in: &disposeBag)
    }

    func transform() {
        
    }
    
}
