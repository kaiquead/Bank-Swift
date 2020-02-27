//
//  ViewController.swift
//  ListaDeCompras
//
//  Created by Kaique Alves on 25/01/20.
//  Copyright © 2020 Kaique Alves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //textField get the item to add
    var bank: Bank!
    var account: ActualAccount!
    @IBOutlet weak var lbInformations: UILabel!
    @IBOutlet weak var lbAccount: UILabel!
    @IBOutlet weak var lbSaldo: UILabel!
    @IBOutlet weak var scOperations: UISegmentedControl!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbDescription2: UILabel!
    @IBOutlet weak var btnDepositar: UIButton!
    @IBOutlet weak var btnSacar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        
        REST.loadAnAccount(onComplete: { (bank) in
            self.bank = bank
            DispatchQueue.main.sync { //coloca na thread principal
                self.lbInformations.text = bank.owner
                self.lbAccount.text = "Conta: " + String(bank.account)
                self.lbSaldo.text = " Saldo: R$ " + String(bank.value)
            }
        
            
        }) { (error) in
            print(error)
         /* switch error{
            case .invalidJSON
                print ("JSON inválido")
            }*/
        }
    }
    
    @IBAction func ReturnLogin(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changeOperation(_ sender: Any) {
        switch scOperations.selectedSegmentIndex {
        case 0:
            lbDescription.text = "Deseja fazer um depósito?"
            lbDescription2.text = "É simples e rápido, venha conferir!"
            btnDepositar.isHidden = false
            btnSacar.isHidden = true
        case 1:
            lbDescription.text = "Está precisando de um saque?"
            lbDescription2.text = "Não perca tempo e faça agora mesmo!"
            btnSacar.isHidden = false
            btnDepositar.isHidden = true
        default:
            lbDescription.text = "Vai transferir?"
            lbDescription2.text = "Basta clicar abaixo para iniciar a transferência!"
        }
    }
    
}


