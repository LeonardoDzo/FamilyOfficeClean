//
//  SignUpViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 31/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Eureka
class SignUpViewController: FormViewController {
    
    let cancel = UIBarButtonItem(image: #imageLiteral(resourceName: "back-27x20").maskWithColor(color: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)), style: .plain, target: self, action: nil)
    var viewModel: SignUpviewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.backBtn
        setupView()
    }
    func setupView() -> Void {
        form +++ Section("Información Personal")
            <<<  TextRow(){ row in
                row.title = "Nombre"
                row.placeholder = ""
            }
            <<< PhoneRow(){
                $0.title = "Teléfono"
                $0.placeholder = "Número"
            }
            <<<  EmailRow(){ row in
                row.title = "Email"
                row.placeholder = ""
            }
        +++ Section("")
            <<< PasswordRow() {
                $0.title = "Contraseña"
            }
            <<< PasswordRow() {
                $0.title = "Repetir Contraseña"
            }
    
        let input = SignUpviewModel.Input(cancelTrigger: cancel.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        
        output.dismiss
            .drive()
            .dispose()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
