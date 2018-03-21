//
//  UserPersonalFormViewController.swift
//  familyOffice
//
//  Created by Leonardo Durazo on 24/11/17.
//  Copyright © 2017 Leonardo Durazo. All rights reserved.
//

import UIKit
import Eureka
import RxCocoa
import RxSwift

class UserPersonalFormViewController: FormViewController {
    private let disposeBag = DisposeBag()
     let addbtn = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: nil)
    var user : Variable<User>!
    var viewModel: UserPersonalViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
       
        
        self.navigationItem.leftBarButtonItem = self.backBtn
        self.hideKeyboardWhenTappedAround()
        self.navigationItem.rightBarButtonItem = addbtn
        
        form +++ Section("Información Básica")
            
            <<< TextRow() { row in
                row.title = "Nombre"
                row.placeholder = "Mi nombre"
                row.add(rule: RuleRequired())
                row.add(rule: RuleMinLength(minLength: 5, msg: "Mínimo 4 letras."))
                row.add(rule: RuleMaxLength(maxLength: 20, msg: "Máximo 20 letras."))
                row.validationOptions = .validatesOnChange
                row.value = user.value.name
                row.tag = "name"
                }.onChange {  row in
                    self.user.value.name = row.value!
                    
                }
            
            <<< PhoneRow() { row in
                row.title = "Télefono"
                row.placeholder = "Mi télefono"
                row.value = user.value.phone
                row.add(rule: RuleRequired())
                row.add(rule: RuleExactLength(exactLength: 10))
                row.tag = "phone"
                }.onChange({ (row) in
                    self.user.value.phone = row.value ?? ""
                })
                .cellUpdate { cell, row in
                    if !row.isValid {
                        cell.titleLabel?.textColor = .red
                    }else{
                        self.user.value.phone = row.value ?? ""
                    }
            }
        
      +++  Section("Información Personal")
            
            <<< TextRow() { row in
                row.title = "RFC"
                row.placeholder = "RFC"
                row.value = user.value.rfc
                }.onChange {  row in
                   self.user.value.rfc = row.value ?? ""
                    
                }
            
            <<< TextRow() { row in
                row.title = "NSS"
                row.placeholder = "Número de seguro social"
                row.value = user.value.nss
                row.add(rule: RuleExactLength(exactLength: 11))
                }.onChange {  row in
                    self.user.value.nss = row.value ?? ""
                }
            
            <<< DateRow() { row in
                row.title = "Cumpleaños"
                    row.value = Date(user.value.birth)
                }.onChange {  row in
                    self.user.value.birth = row.value?.toMillis() ?? 0
                }
            
            <<< TextRow() { row in
                row.title = "Dirección"
                row.placeholder = "Dirección"
                row.value = user.value.address?.city
                }.onChange({ (value) in
                    if value.isValid {
                        self.user.value.address?.city = value.value ?? ""
                    }
                })
            <<< PushRow<String>() { row in
                row.title = "Tipo de Sangre"
                row.options = ["A+","A-","O+","O-","B+","B-","AB+","AB-"]
                row.value = user.value.bloodyType
                row.selectorTitle = "Escoge un tipo de sangre"
                }.onChange({ (row) in
                    if row.isValid {
                        self.user.value.bloodyType = row.value ?? ""
                        row.updateCell()
                    }
                }).onPresent({ (form, to) in
                    to.dismissOnSelection = true
                    to.dismissOnChange = false
                })
        
        +++ Section("Caja fuerte")
            <<< LabelRow() { row in
                row.title = "Cambiar contraseña"
                
                }.onCellSelection({ (cell, row) in
//                    self.gotoView(view: .setSafeboxPwd, sender: nil, navigation: true)
                })
//                .cellUpdate { cell, row in
//                    if !row.isValid {
//                        cell.titleLabel?.textColor = .red
//                    }else{
//                        try! rManager.realm.write {
//                            self.user.rfc = row.value ?? ""
//                        }
//                    }
//        }
        
        navigationOptions = RowNavigationOptions.Enabled.union(.StopDisabledRow)
        // Enables smooth scrolling on navigation to off-screen rows
        animateScroll = true
        // Leaves 20pt of space between the keyboard and the highlighted row after scrolling to an off screen row
        rowKeyboardSpacing = 20
        bindToView()
    }
    
    func bindToView() -> Void {
        let input = UserPersonalViewModel.Input(user: self.user.asDriver(), tapSave: self.addbtn.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        
        output.error
            .drive(self.errorBinding)
            .disposed(by: disposeBag)
        output.canSave
            .drive(self.addbtn.rx.isEnabled)
            .disposed(by: disposeBag)
        output.saved
            .drive()
            .disposed(by: disposeBag)
    }
    override func viewWillAppear(_ animated: Bool) {
          self.navigationController?.isNavigationBarHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

