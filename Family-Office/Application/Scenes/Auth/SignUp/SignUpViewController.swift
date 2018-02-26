//
//  SignUpViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 31/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Eureka
import RxCocoa
import RxSwift
import GenericPasswordRow

class SignUpViewController: FormViewController {
    private let disposeBag = DisposeBag()
    private var pass = ""
    private var user = Variable(User(name: "", email: "", phone: ""))
    let cancel = UIBarButtonItem(image: #imageLiteral(resourceName: "back-27x20").maskWithColor(color: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)), style: .plain, target: self, action: nil)
    let save = UIBarButtonItem(title: "Registrarse", style: .plain, target: self, action: nil)

    var viewModel: SignUpviewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.backBtn
        self.navigationItem.rightBarButtonItem = self.save
        self.navigationItem.title = "Registro"
        setupView()
    }
    func setupView() {

        let nametxt = TextRow() { row in
            row.title = "Nombre"
            row.tag = "name"
            row.add(rule: RuleRequired())
            row.add(rule: RuleMinLength(minLength: 5, msg: "Mínimo 4 letras."))
            row.add(rule: RuleMaxLength(maxLength: 20, msg: "Máximo 20 letras."))
            row.validationOptions = .validatesOnChange
            row.value = user.value.name
            row.placeholder = ""
            }.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                } else {
                    self.user.value.name = row.value!
                }
        }
        let phone = PhoneRow() {
            $0.title = "Teléfono"
            $0.tag = "phone"
            $0.value = self.user.value.phone
            $0.add(rule: RuleRequired())
            $0.add(rule: RuleExactLength(exactLength: 10))
            $0.placeholder = "Número"
            }.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                } else {
                    self.user.value.phone = row.value ?? ""

                }
        }
        let email = EmailRow() { row in
            row.title = "Email"
            row.tag = "email"
            row.value = self.user.value.email
            row.add(rule: RuleRequired())
            row.add(rule: RuleEmail())
            row.placeholder = ""
            }.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                } else {
                    self.user.value.email = row.value ?? ""
                }
        }
        let password = GenericPasswordRow() {
            $0.tag = "password"
            $0.add(rule: RuleRequired())
            $0.add(rule: RuleMinLength(minLength: 6, msg: "Mínimo 6 letras."))
            $0.validationOptions = .validatesOnChange
            }.onChange({ (row) in
                self.pass = row.value ?? ""
            }).cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
        }
        let rpassword = GenericPasswordRow() {
            $0.tag = "rpassword"
            $0.add(rule: RuleRequired())
            $0.add(rule: RuleMinLength(minLength: 6, msg: "Mínimo 6 letras."))
            }.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                } else {
                    if password.value != row.value {
                        cell.titleLabel?.textColor = .red
                    }
                }
        }

        form +++ Section("Información Personal")
            <<< nametxt
            <<< phone
            <<< email
        +++ Section("")
            <<< password
            <<< rpassword

         let input = SignUpviewModel.Input(cancelTrigger: cancel.rx.tap.asDriver(), saveTrigger: save.rx.tap.asDriver(), email: email.rx.value.orEmpty.asDriver(), phone: phone.rx.value.orEmpty.asDriver(), name: nametxt.rx.value.orEmpty.asDriver(), pass: password.rx.value.orEmpty.asDriver(), rpass: rpassword.rx.value.orEmpty.asDriver())
        let output = viewModel.transform(input: input)

        output.dismiss
            .drive()
            .dispose()
        output.saveEnabled
            .drive(self.save.rx.isEnabled)
            .disposed(by: disposeBag)
        output.error
            .drive(self.errorBinding)
            .disposed(by: disposeBag)
        output.saved.drive().disposed(by: disposeBag)

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
