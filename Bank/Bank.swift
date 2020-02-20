//
//  Bank.swift
//  ListaDeCompras
//
//  Created by Kaique Alves on 27/01/20.
//  Copyright © 2020 Kaique Alves. All rights reserved.
//

import Foundation

class Bank: Codable{
    
    var value: Double = 0.0
    var admin: String = "false"
    var _id: String = ""
    var account: Int = 0
    var owner: String = ""
    var password: String = ""
    var __v: Int = 0
    }

//{"value":0,"admin":false,"_id":"5e4743ba16289f002426ed37","account":3041,"owner":"teste da silva","password":"teste","__v":0}
