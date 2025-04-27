//
//  Double.swift
//  Ryde
//
//  Created by baxtiyor bekmurodov on 26/04/25.
//

import Foundation

extension Double {
    
    private var currencyFormatter : NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 4
        
        return formatter
    }
    
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? ""
    }
}
