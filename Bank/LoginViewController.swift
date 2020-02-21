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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        
        bank.account = integer(from: tfAccount)
        bank.password = tfPassword.text!
        account.setActualAccount(account: integer(from: tfAccount))
        
        REST.login(bank: bank) { (sucess) in
            if sucess == true{
                print ("true")
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "firstSegue", sender: nil)
                }
            }
            else {
                print ("false")
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "segueErrorLogin", sender: nil)
                }
                
            }
            
        }
    }
    

    func integer(from textField: UITextField) -> Int {
        guard let text = textField.text, let number = Int(text) else {
            return 0
        }
        return number
    }
}
