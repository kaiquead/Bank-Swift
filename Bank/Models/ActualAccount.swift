//
//  ActualAccount.swift
//  Bank
//
//  Created by Kaique Alves on 15/02/20.
//  Copyright © 2020 Kaique Alves. All rights reserved.
//

import Foundation

class ActualAccount{
    //-1
    private static var actualAccount: Int = -1
    
    init() {
        ActualAccount.self.actualAccount = ActualAccount.self.actualAccount
    }
    
    func getActualAccount()->Int{
        return ActualAccount.self.actualAccount
    }
    
    func setActualAccount(account: Int)->Void{
        ActualAccount.self.actualAccount = account
    }
}
