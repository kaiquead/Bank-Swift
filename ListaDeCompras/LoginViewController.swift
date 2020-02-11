//
//  LoginViewController.swift
//  ListaDeCompras
//
//  Created by Kaique Alves on 08/02/20.
//  Copyright © 2020 Kaique Alves. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showFirstScreen(_ sender: UIStoryboardSegue) {
        performSegue(withIdentifier: "firstSegue", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
