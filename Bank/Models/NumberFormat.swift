//
//  NumberFormat.swift
//  Bank
//
//  Created by Kaique Alves on 11/05/20.
//  Copyright © 2020 Kaique Alves. All rights reserved.
//

import Foundation

class NumberFormat{
    
    let formatter = NumberFormatter()
    
    init(){
        formatter.usesGroupingSeparator = true
    }
    
    func getFormattedValue(of value: Double) -> String{
        formatter.numberStyle = .currency
        formatter.currencySymbol = "R$"
        formatter.alwaysShowsDecimalSeparator = true
        return formatter.string(for: value)!
    }
    
    func formatToDouble(_ string: String) ->Double{
        formatter.numberStyle = .none
        return formatter.number(from: string)!.doubleValue
    }
}
