//
//  TransferViewController.swift
//  Bank
//
//  Created by Kaique Alves on 27/02/20.
//  Copyright © 2020 Kaique Alves. All rights reserved.
//

import UIKit

class TransferViewController: UIViewController {

    var bank: TransferAccBank!
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var tfIncAccount: UITextField!
    
    @IBOutlet weak var tfOutAccount: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func makeTransfer(_ sender: Any) {
        if bank == nil{
            bank = TransferAccBank()
        }
        if tfValue.text == "" || tfIncAccount.text == "" || tfOutAccount.text == ""{
            showAlertMessage(title: "Erro!", message: "Preencha todos os campos!")
        }
        if tfOutAccount.text == tfIncAccount.text{
            showAlertMessage(title: "Erro!", message: "Você não pode transferir para a mesma conta! Digite uma conta diferente")
        }
        bank.outAccount = Int(tfOutAccount.text!)!
        bank.incAccount = Int(tfIncAccount.text!)!
        bank.value = Double(tfValue.text!)!
        
        REST.transfer(bank: bank, onComplete: { (sucess) in
            if sucess == true{
                self.showAlertMessage(title: "Sucesso!", message: "A transferência foi feita com sucesso!")
            }
        }) { (error) in
            switch error{
            case .url:
                print ("Erro com URL")
            case .invalidJSON:
                print ("JSON invalido")
            case .noResponse:
                print ("Sem resposta")
            case .noValueTransfer:
                print ("sem saldo")
                self.showAlertMessage(title: "Erro", message: "Você não possui esse valor na conta de origem para ser feito a transferência!")
            case .responseStatusCodeTransfer:
                print ("Algum erro aconteceu. O status code não é 200 e nem 400")
            default:
                print("Erro com DataTask")
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
