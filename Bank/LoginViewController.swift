//
//  LoginViewController.swift
//  ListaDeCompras
//
//  Created by Kaique Alves on 08/02/20.
//  Copyright © 2020 Kaique Alves. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    var bank: Bank!
    var account: ActualAccount!
    @IBOutlet weak var tfAccount: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnShowPassword: UIButton!
    @IBOutlet weak var aiSpinner: UIActivityIndicatorView!
    @IBOutlet weak var btnIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(true, animated: true)
        aiSpinner.hidesWhenStopped = true
    }
   override func viewDidDisappear(_ animated: Bool){
        super.viewDidDisappear(true)
        tfAccount.text = ""
        tfPassword.text = ""
    }
    
    @IBAction func showFirstScreen(_ sender: UIStoryboardSegue) {
        //performSegue(withIdentifier: "firstSegue", sender: nil)
    }
    
    @IBAction func loginAdd(_ sender: Any) {
        if bank == nil {
            bank = Bank()
        }
        if account == nil{
            account = ActualAccount()
        }
        if tfAccount.text == "" || tfPassword.text == ""{
            let alert = UIAlertController(title: "Erro para entrar", message: "Conta ou Senha em branco. Preencha com valores válidos!", preferredStyle: .alert)
                 let ok = UIAlertAction(title: "Voltar", style: .default, handler: { action in
                 })
                 alert.addAction(ok)
                 DispatchQueue.main.async(execute: {
                    self.present(alert, animated: true)
            })
            return
        }
        else{
            DispatchQueue.main.async {
                self.aiSpinner.startAnimating()
            }
            
        }
        
        bank.account = integer(from: tfAccount)
        bank.password = tfPassword.text!
        account.setActualAccount(account: integer(from: tfAccount))
        
        REST.login(bank: bank) { (sucess) in
            if sucess == true{
                print ("true")
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "firstSegue", sender: nil)
                }
                DispatchQueue.main.async {
                    self.aiSpinner.stopAnimating()
                }
            }
            else {
                print ("false")
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "segueErrorLogin", sender: nil)
                }
                DispatchQueue.main.async {
                    self.aiSpinner.stopAnimating()
                }
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
    

    func integer(from textField: UITextField) -> Int {
        guard let text = textField.text, let number = Int(text) else {
            return 0
        }
        return number
    }
}
