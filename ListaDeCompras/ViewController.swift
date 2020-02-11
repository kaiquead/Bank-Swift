//
//  ViewController.swift
//  ListaDeCompras
//
//  Created by Kaique Alves on 25/01/20.
//  Copyright © 2020 Kaique Alves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //view to add Items
    @IBOutlet weak var vInputItem: UIView!
    //textField get the item to add
    @IBOutlet weak var tfItem: UITextField!
    var bank: [Bank] = []
    @IBOutlet weak var tfInformations: UITextField!
    @IBOutlet weak var lbInformations: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        REST.loadBank(onComplete: { (bank) in
            self.bank = bank
            DispatchQueue.main.sync { //coloca na thread principal
                var informations: String = ""
                for i in bank{
                    informations = informations + String(i.account) + i.owner + i.password + String(i.value) + "    "
                }
                self.lbInformations.text = informations
            }
        
            
        }) { (error) in
            print(error)
   /*         switch error{
            case .invalidJSON
                print ("JSON inválido")
            }*/
        }
    }

    
    
    @IBAction func btnCreateItem(_ sender: Any) {
        vInputItem.isHidden = false
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        
    }
    
    @IBAction func btnReturn(_ sender: Any) {
        vInputItem.isHidden = true
    }
}



//
