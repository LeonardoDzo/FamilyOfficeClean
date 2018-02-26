//
//  AddEditPendingViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 12/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Eureka
import RxSwift
import RxCocoa

class AddEditPendingViewController: FormViewController {
    private let disposeBag = DisposeBag()

    var saveBtn = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: nil)
    var pending: Variable<Pending> = Variable(Pending())
    var viewModel: AddEditPendingViewModel!
    fileprivate func searchKey(_ key: String, _ value: Any?) {

        switch key {
        case "title":
            self.pending.value.title = value as? String ?? ""
            break
        case "details":
            self.pending.value.details = value as? String ?? ""
            break
        case "priority":
            self.pending.value.priority = value as? PENDING_PRIORITY ?? .Normal
            break
        case "done":
            self.pending.value.done = value as! Bool
            break
        default:
            break
        }
    }

    fileprivate func setupForm() {
        form +++ Section("")
            <<< TextRow() { row in
                row.title = "Titúlo"
                row.placeholder = "Título"
                row.tag = "title"
                row.value = pending.value.title
                row.add(rule: RuleRequired())
            }.onChange({
                self.searchKey($0.tag!, $0.value)
            })

            <<< TextAreaRow() { row in
                row.title = "Descripción"
                row.placeholder = "Descripción"
                row.value = pending.value.details
                row.tag = "details"
                }.onChange({
                    self.searchKey($0.tag!, $0.value)
                })
            <<< PushRow<PENDING_PRIORITY>() { row in
                row.title = "Prioridad"
                row.options = [.Low, .Normal, .High]
                row.value = self.pending.value.priority
                row.tag = "priority"
                row.selectorTitle = ""

                self.navigationController?.setNavigationBarHidden(false, animated: true)
                }.onChange({ (row) in
                    self.searchKey(row.tag!, row.value)
                    if row.isValid {
                        row.updateCell()
                    }
                }).onPresent({ (form, to) in
                    to.navigationController?.setNavigationBarHidden(false, animated: true)
                    to.dismissOnSelection = true
                    to.dismissOnChange = false
                })
            <<< CheckRow() { row in
                row.tag = "done"
                row.title = "Finalizada"
                row.value = pending.value.done
                row.hidden = Condition(booleanLiteral: pending.value.uid.isEmpty)
                }.onChange({
                    self.searchKey($0.tag!, $0.value)
                })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationItem.titleView = nil
        saveBtn.isEnabled = false
        self.navigationItem.rightBarButtonItem = saveBtn
        setupForm()
        bindViewModel()
    }
    private func bindViewModel() {

        let input = AddEditPendingViewModel.Input(canSaveTrigger: pending.asDriver(), saveTrigger: self.saveBtn.rx.tap.asDriver())
        let output = viewModel.transform(input: input)

        output.canSave.drive(saveBtn.rx.isEnabled).disposed(by: disposeBag)
        output.save.drive(onNext: { _ in
            if self.pending.value.uid.isEmpty {
                self.pending.value = Pending()
                self.form.removeAll()
                self.setupForm()
            }
        }).disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
