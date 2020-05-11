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
    @IBOutlet weak var btnShowPassword: UIButton!
    var bank:CreateAccBank!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnCreate(_ sender: Any) {
        if bank == nil {
            bank = CreateAccBank()
        }
        bank.owner = tfOwner.text!
        bank.password = tfPassword.text!
        bank.email = tfEmail.text!
        
        REST.createAccount(bank: bank, onComplete: { (sucess) in
            if sucess == true{
                self.showAlertMessage(title: "Sucesso!", message: "A conta foi criada com sucesso! Um e-mail será enviado contendo o número da nova conta criada!")
            }
            else{
                self.showAlertMessage(title: "Erro!", message: "URL ou status code inválido. Contate o desenvolvedor")
            }
        }) { (error) in
            switch error{
            case .duplicatedEmail:
                print("email duplicado")
                self.showAlertMessage(title: "Erro!", message: "Esse e-mail já está cadastrado! Use outro email para a criação da conta")
            default:
                print ("Um erro foi detectado. Contacte o desenvolvedor!")
                self.showAlertMessage(title: "Erro!", message: "Um erro foi detectado. Contacte o desenvolvedor!")
            }
            
        }
    }
    
    @IBAction func showPassword(_ sender: Any) {
        if self.tfPassword.isSecureTextEntry == false{
            self.tfPassword.isSecureTextEntry = true
            self.btnShowPassword.setTitle("Mostrar", for: .normal)
        }
        else{
            self.tfPassword.isSecureTextEntry = false
            self.btnShowPassword.setTitle("Esconder", for: .normal)
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
