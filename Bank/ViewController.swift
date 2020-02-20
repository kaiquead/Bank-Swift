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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(true, animated: true)
        REST.loadAnAccount(onComplete: { (bank) in
            self.bank = bank
            DispatchQueue.main.sync { //coloca na thread principal
                self.lbInformations.text = bank.owner
                
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
    
    
}



//
