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
    @Published var loanTermMethod: Int = 0
    
    // output
    @Published var totalPaid: String = ""
    @Published var totalInterest: String = ""
    @Published var firstPayment: String =  ""
    
    @Published var loanAmountError: String = ""
    @Published var loanTermError: String = ""
    @Published var interestRateError: String = ""
    
    @Published var isShowButtonAmortization = false
    
    private var disposeBag = Set<AnyCancellable>()
    
    @Published var isFirstLaunch = true
    
    enum LoanMethodEnum: Int {
        case flat = 0
        case reduce
    }
    
    enum LoanTermMethodEnum: Int {
        case month = 0
        case year
    }

    init() {
        $loanAmount.map { item in
            if item.count == 0 {return ""}
            if let int = Int(item), int > 0 {
                self.isFirstLaunch = false
                return ""
            }
            return NSLocalizedString("txtErrorLoanAmount", comment: "")
        }.assign(to: \.loanAmountError, on: self).store(in: &disposeBag)

        $term.map { item in
            if item.count == 0 {return ""}
            if let int = Int(item), int > 0 {
                self.isFirstLaunch = false
                return ""
            }
            return NSLocalizedString("txtErrorLoanTerm", comment: "")
        }.assign(to: \.loanTermError, on: self).store(in: &disposeBag)
        
        $rate.map { _rate in
            if _rate.count == 0 {return ""}
            if let _rate = Int(_rate), _rate > 0 {
                self.isFirstLaunch = false
                return ""
            }
            
            return NSLocalizedString("txtErrorInterestRate", comment: "rate interest")
        }.assign(to: \.interestRateError, on: self).store(in: &disposeBag)
        
        // verify error message
        if (self.loanAmountError.isEmpty && self.loanTermError.isEmpty && self.interestRateError.isEmpty) {
            // caculate begin
            // check loan method
//            let monthLoanTime = self.loanTermMethod == .month ? Int(self.term)! : (Int(self.term)! * 12)
            
            if (self.loanMethod == 0) {
                Publishers.CombineLatest4(self.$loanAmount, self.$rate, self.$loanTermMethod, self.$term).map { output in
                    if let loanAmountOutput = Double(output.0),
                       let rateOutput = Double(output.1),
                       let termOutput = Double(output.3)
                    {
                
                        let loantermMethodOutput = output.2
                        let periodYear = (loantermMethodOutput == 0) ? (termOutput/12) : termOutput
                        let periodMonth = (loantermMethodOutput == 0) ? termOutput : termOutput*12
                        
                        let dTotalInterest = loanAmountOutput*periodYear*rateOutput/100
                        let dTotalPaid = loanAmountOutput + dTotalInterest
                        let dFirstPayment = dTotalPaid/periodMonth
 
                        let strTotalPaid = dTotalPaid.formatCurrency()
                        let strTotalInterest = dTotalInterest.formatCurrency()
                        let strFirstPayment = dFirstPayment.formatCurrency()
                        
                        self.totalPaid = strTotalPaid
                        self.totalInterest = strTotalInterest
                        self.firstPayment = strFirstPayment

                        return false
                    } else {
                        return true
                    }
                }.assign(to: \.isFirstLaunch, on: self).store(in: &disposeBag)

//                    .sink { loanAmountOutput, rateOutput, loantermMethodOutput in
                    
//                    let abc = Int(loanAmountOutput) * Int(rateOutput) * ((loantermMethodOutput == .month) ? Int(self.term)! : (Int(self.term)! * 12))
//                    print(abc)
                                                                                //.store(in: &disposeBag)
                
            } else {
                
            }
            // caculate end
        } else {
            
        }
    }

    func transform() {
        
    }
    
}
