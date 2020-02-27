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
        if tfAccount.text == "" || tfDepositValue.text == ""{
            showAlertMessage(title: "Erro!", message: "Preencha todos os campos!")
            return
        }
        
        
        bank.account = Int(tfAccount.text!)!
        bank.value =  Double(tfDepositValue.text!)!
        
        REST.deposit(bank: bank) { (sucess) in
            if sucess == true{
                print ("depositou")
                DispatchQueue.main.async {
                    self.showAlertMessage(title: "Sucesso", message: "O depósito foi feito com sucesso!")
                    self.dismiss(animated: true, completion: nil)
                }
                
            }
            else{
                self.showAlertMessage(title: "Erro", message: "O depósito não foi feito. Revise as informações")
            }
            
        }
    }
    
    func showAlertMessage(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
             let ok = UIAlertAction(title: "Voltar", style: .default, handler: { action in
             })
             alert.addAction(ok)
             DispatchQueue.main.async(execute: {
                self.present(alert, animated: true)
        })
    }
    

    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
