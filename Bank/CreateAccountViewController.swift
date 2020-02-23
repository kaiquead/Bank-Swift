//
//  CreateAccountViewController.swift
//  Bank
//
//  Created by Kaique Alves on 14/02/20.
//  Copyright © 2020 Kaique Alves. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var tfOwner: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    var bank:CreateAccBank!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnCreate(_ sender: Any) {
        if bank == nil {
            bank = CreateAccBank()
        }
        bank.owner = tfOwner.text!
        bank.password = tfPassword.text!
        bank.email = tfEmail.text!
        
        REST.createAccount(bank: bank) { (sucess) in
            if sucess == true{
              let alert = UIAlertController(title: "Tudo certo!", message: "Sua conta foi criada com sucesso!", preferredStyle: .alert)

                   let ok = UIAlertAction(title: "Voltar para o login", style: .default, handler: { action in
                   })
                   alert.addAction(ok)
                   DispatchQueue.main.async(execute: {
                      self.present(alert, animated: true)
              })
                //self.navigationController?.popViewController(animated: true)
                //self.dismiss(animated: true, completion: nil)
               
                print ("true")
            }
            else {
                let alert = UIAlertController(title: "Algo deu errado!", message: "Tente novamente criar sua conta!", preferredStyle: .alert)

                     let Nok = UIAlertAction(title: "Tentar de novo", style: .default, handler: { action in
                     })
                     alert.addAction(Nok)
                     DispatchQueue.main.async(execute: {
                        self.present(alert, animated: true)
                })
                print ("false")
            }
            
        }
    }
    

}
