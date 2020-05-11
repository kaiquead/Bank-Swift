//
//  WithdrawViewController.swift
//  Bank
//
//  Created by Kaique Alves on 26/02/20.
//  Copyright © 2020 Kaique Alves. All rights reserved.
//

import UIKit

class WithdrawViewController: UIViewController {

    var bank: WithdrawAccBank!
    var numberFormat: NumberFormat!
    
    @IBOutlet weak var tfAccount: UITextField!
    @IBOutlet weak var tfValue: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func makeWithdraw(_ sender: Any) {
        if bank == nil {
            bank = WithdrawAccBank()
        }
        if numberFormat == nil{
            numberFormat = NumberFormat()
        }
        if tfAccount.text == "" || tfValue.text == ""{
            showAlertMessage(title: "Erro", message: "Preencha todos os campos!")
            return
        }
        if (tfValue.text?.contains(","))!{
            showAlertMessage(title: "Erro!", message: "O valor não pode ter virgula. ")
            return
        }
        bank.account = Int(tfAccount.text!)!
        bank.value = numberFormat.formatToDouble(tfValue.text!)
        
        REST.withdraw(bank: bank) { (sucess) in
            if sucess == true{
                print("Sacou!!")
                DispatchQueue.main.async {
                    self.showAlertMessage(title: "Sucesso", message: "O saque foi feito com sucesso!")
                    self.navigationController?.popViewController(animated: true)
                }
            }
            else{
                print ("Não depositou!")
                DispatchQueue.main.async {
                    self.showAlertMessage(title: "Erro", message: "O saque não foi feito. Revise as informações")
                }
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
    
}
