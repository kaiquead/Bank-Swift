//
//  SaqueViewController.swift
//  ListaDeCompras
//
//  Created by Kaique Alves on 10/02/20.
//  Copyright © 2020 Kaique Alves. All rights reserved.
//

import UIKit

class DepositViewController: UIViewController {

    var bank: DepositAccBank!
    @IBOutlet weak var tfDepositValue: UITextField!
    @IBOutlet weak var tfAccount: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func btnDeposit(_ sender: Any) {
        if bank == nil {
            bank = DepositAccBank()
        }
        bank.account = Int(tfAccount.text!)!
        bank.value =  Double(tfDepositValue.text!)!
    
        REST.deposit(bank: bank) { (sucess) in
            if sucess == true{
                print ("depositou")
            }
            else{
                print ("não depositou")
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    

    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
