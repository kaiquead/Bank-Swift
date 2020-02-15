//
//  ActualAccount.swift
//  Bank
//
//  Created by Kaique Alves on 15/02/20.
//  Copyright © 2020 Kaique Alves. All rights reserved.
//

import Foundation

class ActualAccount{
    var actualAccount: Int
    
    init(actualAccount: Int) {
        self.actualAccount = actualAccount
    }
    
    func getActualAccount()->Int{
        return self.actualAccount
    }
}
