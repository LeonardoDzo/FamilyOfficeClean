//
//  IllnessViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 01/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Eureka
import RxSwift
import RxCocoa

class IllnessViewController: FormViewController {
    private let disposeBag = DisposeBag()
    var model = Variable(Illness())
    var addBtn: UIBarButtonItem!
    var viewModel: IllnessAddViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.setupView()
        }
        self.setupView()
    }
    func setupView() -> Void {
        let title = model.value.uid.isEmpty ? "Guardar" : "Editar"
        addBtn = UIBarButtonItem(title: title, style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = addBtn
  
        var rules = RuleSet<String>()
        rules.add(rule: RuleRequired())
        rules.add(rule:  RuleMinLength(minLength: 4))
        
        self.title = "Nuevo"
        form +++ Section("")
            <<< AlertRow<ILLNESSTYPE>() { row in
                row.title = "Que tipo es?"
                row.options = [ILLNESSTYPE.Disease, ILLNESSTYPE.Pain]
                row.value = model.value.type
                
                }.onChange {
                    self.model.value.type = $0.value ?? .Disease
                }

            <<< TextRow(){ row in
                row.placeholder = "Nombre del dolor/enfermedad"
                row.add(ruleSet: rules)
                row.value = model.value.name
                }.onChange {
                    self.model.value.name = $0.value ?? ""
            }
            <<< TextAreaRow(){ row in
                row.title = "Medicina(s)"
                row.placeholder = "Ingrese la medicina para dolor/enfermedad"
                row.add(ruleSet: rules)
                row.value = model.value.medicines
                }.onChange {
                    self.model.value.medicines = $0.value ?? ""
            }
        +++ Section("")
            <<< TextAreaRow(){ row in
                row.title = "Dosis/Detalles"
                row.placeholder = "Ingrese la dosis y/o detalles"
                row.add(ruleSet: rules)
                row.value = model.value.details
                }.onChange {
                    self.model.value.details = $0.value ?? ""
                }
        
        bindToView()
    }
    
    func bindToView() -> Void {
        let input = IllnessAddViewModel.Input(illnessTrigger: model.asDriver(), saveTrigger: self.addBtn.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        
        output.isEnabled
            .drive(self.addBtn.rx.isEnabled)
            .disposed(by: disposeBag)
        output.error
            .drive(self.errorBinding)
            .disposed(by: disposeBag)
        output.saved
            .drive()
            .disposed(by: disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
