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
    var numberFormt: NumberFormat!
    @IBOutlet weak var lbInformations: UILabel!
    @IBOutlet weak var lbAccount: UILabel!
    @IBOutlet weak var lbSaldo: UILabel!
    @IBOutlet weak var scOperations: UISegmentedControl!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbDescription2: UILabel!
    @IBOutlet weak var btnDepositar: UIButton!
    @IBOutlet weak var btnSacar: UIButton!
    @IBOutlet weak var btnTransferir: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                    /*  -----configurações para a cor do Segment Control-----*/
        let titleTextAttributesNormal = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let titleTextAttributesSelected = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        scOperations.setTitleTextAttributes(titleTextAttributesNormal, for: .normal)
        scOperations.setTitleTextAttributes(titleTextAttributesSelected, for: .selected)
    }
    
    override func viewWillAppear(_ animated: Bool){
        if numberFormt == nil{
            numberFormt = NumberFormat()
        }
        
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        REST.loadAnAccount(onComplete: { (bank) in
            self.bank = bank
            DispatchQueue.main.sync { //coloca na thread principal
                self.lbInformations.text = bank.owner
                self.lbAccount.text = "Conta: " + String(bank.account)
                //self.lbSaldo.text = " Saldo: R$ " + String(bank.value)
                self.lbSaldo.text = "Saldo: " + self.numberFormt.getFormattedValue(of: bank.value)
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
            btnTransferir.isHidden = true
        case 1:
            lbDescription.text = "Está precisando de um saque?"
            lbDescription2.text = "Não perca tempo e faça agora mesmo!"
            btnSacar.isHidden = false
            btnDepositar.isHidden = true
            btnTransferir.isHidden = true
        default:
            lbDescription.text = "Vai transferir?"
            lbDescription2.text = "Basta clicar abaixo para iniciar a transferência!"
            btnTransferir.isHidden = false
            btnSacar.isHidden = true
            btnDepositar.isHidden = true
            
        }
    }    
    @IBAction func makeDeposit(_ sender: Any) {
        performSegue(withIdentifier: "segueViewToDeposit", sender: nil)
    }
    
    
    @IBAction func makeWithdraw(_ sender: Any) {
        performSegue(withIdentifier: "segueViewToWithdraw", sender: nil)
    }
    
    @IBAction func makeTransfer(_ sender: Any) {
        performSegue(withIdentifier: "segueViewToTransfer", sender: nil)
    }
    
}


