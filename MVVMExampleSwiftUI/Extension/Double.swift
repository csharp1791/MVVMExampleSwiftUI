//
//  Double.swift
//  MVVMExampleSwiftUI
//
//  Created by Cliff Sharp on 3/29/23.
//

import Foundation

extension Double {
  
  func toCurrency() -> String {
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyCode = "USD"
    let result = formatter.string(from: self as NSNumber)!
    return result
  }
}
