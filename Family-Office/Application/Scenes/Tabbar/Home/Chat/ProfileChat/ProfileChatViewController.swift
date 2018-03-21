//
//  ProfileChatViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 17/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Eureka
import Kingfisher
import Stevia

class ProfileChatViewController: FormViewController {
    var chat: Chat!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.backBtn
        self.title = "Info."
        self.tabBarController?.tabBar.isHidden = true
        setupView()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() -> Void {
        form +++ Section() { section in
            var header = HeaderFooterView<UIImageView>(.class)
            header.height = {self.view.frame.width}
            let token = UserDefaults().value(forKey: "token") as? String ?? ""
            header.onSetupView = { view, _ in
                switch self.chat.getType() {
                case .OneToOne:
                    let user = self.chat.members.first(where: { $0.user?.uid != me })?.user
                    let url = URL(string: Constants.url.nographql.appending(user?.photo?.url ?? "").appending(user?.photo?.ext.split(separator: ",")[1] ?? ""))
        
                    view.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "profile_default"), options: [.transition(.fade(0.2))])
                    break
                case .Family:
                    let family = self.chat.family
                    let url = URL(string: ((family?.photo?.routes[1] ?? "").appending("?token=\(token)")))
                    view.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "family-default"), options: [.transition(.fade(0.2))])
                    break
                case .Group:
                    let group = self.chat.group
                    let url = URL(string: (group?.photo?.routes[1] ?? "").appending("?token=\(token)"))
                        view.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "family-default"), options: [.transition(.fade(0.2))])
                    break
                }
            }
            section.header = header
            }
            <<< LabelRow() { row in
               var name = ""
                switch self.chat.getType() {
                case .Family:
                    name = chat.family?.name ?? ""
                    break
                case .Group:
                    name = chat.group?.name ?? ""
                    break
                default:
                    name = chat.members.first(where: {$0.user?.uid != me})?.user?.displayName ?? ""
                    break
                }
                row.title = name
                }.onCellSelection { (cell, row) in
                    //go to profile
        }
        
        switch chat.getType() {
        case .OneToOne:
            break
        default:
            var rows: [BaseRow] = chat.members.filter({ $0.user?.uid != me }).map({ member in
                return LabelRow() { row in
                    let user = member.user
                    let url = URL(string: Constants.url.nographql.appending(user?.photo?.url ?? "").appending(user?.photo?.ext.split(separator: ",")[1] ?? ""))
                    row.cell.imageView?.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "profile_default"), options: [.transition(.fade(0.2))])
                    row.cell.imageView?.size(44)
                    row.title = user?.displayName
                    row.cell.imageView?.contentMode = .scaleAspectFill
                    row.cell.clipsToBounds = true
                    //                    row.onCellSelection({ (cell, row) in
                    //                        self.pushToView(view: .profileView, sender: user)
                    //                    })
                }
            })
            rows.insert(LabelRow() { row in
                let user = chat.members.first(where: { $0.user?.uid == me })?.user
                let url = URL(string: Constants.url.nographql.appending(user?.photo?.url ?? "").appending(user?.photo?.ext.split(separator: ",")[1] ?? ""))
                row.title = "Tú"
                
                row.cell.imageView?.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "profile_default"), options: [.transition(.fade(0.2))])
                row.cell.imageView?.size(44)
                row.cell.imageView?.contentMode = .scaleAspectFill
                row.cell.clipsToBounds = true
            }, at: 0)
            var section = Section("\(chat.members.count) Miembros")
            section += rows
            form +++ section
            break
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
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
