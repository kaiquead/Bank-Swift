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
    @IBOutlet weak var tfLogin: UITextField!
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
        bank.owner = tfLogin.text!
        bank.password = tfPassword.text!
        
        REST.login(bank: bank) { (sucess) in
            if sucess == true{
                print ("true")
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "firstSegue", sender: nil)
                }
            }
            else {
                print ("false")
                
            }
            
        }
    }
    

}
