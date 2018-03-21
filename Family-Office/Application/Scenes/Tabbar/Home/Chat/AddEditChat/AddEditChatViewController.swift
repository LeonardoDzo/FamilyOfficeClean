//
//  AddEditChatViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 20/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Eureka
import ImageRow
import RxSwift

class AddEditChatViewController: FormViewController {
    private let disposeBag = DisposeBag()
    var chat: Chat!
    var photo: Data? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        let button = UIBarButtonItem(
            title: "Listo",
            style: .done,
            target: self,
            action: #selector(self.done(_:))
        )
        button.isEnabled = !chat.uid.isEmpty
        self.navigationItem.rightBarButtonItem = button
        
        let section = Section()
        form +++ section
            <<< TextRow() {
                $0.title = "Nombre"
                $0.add(rule: RuleRequired())
                $0.tag = "title"
                $0.validationOptions = .validatesOnChange
                $0.value = chat.group?.name
                }.onChange({ nameRow in
                    let errs = self.form.validate(includeHidden: true)
                    button.isEnabled = errs.count == 0
                    self.chat.group?.name = nameRow.value ?? ""
                })
            <<< ImageRow() {
                $0.title = "Foto de grupo"
                $0.sourceTypes = [.PhotoLibrary, .SavedPhotosAlbum, .Camera]
                $0.clearAction = .yes(style: .destructive)
                $0.tag = "photo"
                }.onChange({ (img) in
                    if let aux = (img.value)?.resizeImage().jpeg(.high)! {
                        self.photo = aux
                    }
                })
            <<< UsersRow() {
                $0.title = "Miembros"
                $0.tag = "members"
                $0.value = UserListSelected(list: chat.members.map({ ($0.user?.uid)! }))
                $0.validationOptions = .validatesOnChange
                var rules = RuleSet<UserListSelected>()
                rules.add(rule: RuleClosure<UserListSelected> { rowValue in
                    return rowValue!.list.count < 2 ? ValidationError(msg: "2 o mas miembros requeridos") : nil
                })
                $0.add(ruleSet: rules)
                }.onChange({ row in
                     self.chat.members.removeAll()
                    row.value?.list.forEach({ (uid) in
                        self.chat.members.append(ChatMembership(uid: "", isAdmin: false, seenAt: 0, user: Sender(uid: uid, displayName: "", photo: nil)))
                    })
                    button.isEnabled = self.form.validate(includeHidden: true).count == 0
                })
        if !chat.uid.isEmpty {
            section <<< ButtonRow() {
                $0.title = "Eliminar grupo"
                }.cellUpdate({ cell, row in
                    cell.textLabel?.textColor = UIColor.red
                }).onCellSelection({ cell, row in
                    let ctrl = UIAlertController(title: "¿Seguro que quiere eliminar el grupo?", message: nil, preferredStyle: .alert)
                    ctrl.addAction(UIAlertAction(title: "Aceptar", style: .destructive, handler: { (_) in
                    }))
                    ctrl.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: nil))
                    self.present(ctrl, animated: true, completion: nil)
                })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func done(_ sender: Any) {
        
        NetUseCaseProvider().makeChatUseCase()
            .create(chat: self.chat, data: self.photo)
            .subscribe()
            .disposed(by: disposeBag)
    }

}
