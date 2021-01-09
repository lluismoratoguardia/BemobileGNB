//
//  RateUtils.swift
//  BemobileGNB
//
//  Created by Admin on 09/01/2021.
//

import Foundation

struct RateUtils {
    func convertTo(_ newCurrency: String, amount: String, currency: String, rates: [RateModel], completion: @escaping(Double) -> Void) {
        guard let amountNumber = Double(amount) else {
            return
        }
        
        if newCurrency == currency {
            completion(1)
        } else {
            calculateRate(from: currency, to: newCurrency, rates: rates, completion: completion)
        }
    }
    
    func calculateRate(from: String, to: String, rates: [RateModel], checkedCurrencies: [String] = [String](), previousRate: String = "1", completion: @escaping(Double) -> Void) {
        let filterRates = rates.filter({$0.to == to && !checkedCurrencies.contains($0.from)})
        
        if filterRates.count == 0 {
            completion(0)
        } else {
            if let rate = filterRates.first(where: {$0.from == from}) {
                completion((Double(rate.rate) ?? 0) * (Double(previousRate) ?? 0))
            } else {
                filterRates.forEach { (rate) in
                    var checkedCurrencies = checkedCurrencies
                    checkedCurrencies.append(rate.from)
                    let newRate = (Double(previousRate) ?? 0) * (Double(rate.rate) ?? 0)
                    calculateRate(from: from, to: rate.from, rates: rates, checkedCurrencies: checkedCurrencies, previousRate: String(newRate), completion: completion)
                }
            }
        }
    }
}
