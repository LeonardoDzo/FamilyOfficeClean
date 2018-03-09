//
//  ChatViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 06/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import SlackTextViewController
import RxSwift
import RxDataSources
import RxCocoa
import Stevia
struct CustomData {
    var message: String
    var send: Date
}

struct SectionOfMessages {
    var header: Date
    var items: [Item]
    init(value: (key: Date, value: [Item])) {
        self.header = value.key
        self.items = value.value
    }
}

extension SectionOfMessages: SectionModelType {
    typealias Item = CustomData
    
    init(original: SectionOfMessages, items: [Item]) {
        self = original
        self.items = items
    }
}


class ChatViewController: SLKTextViewController {
    private let disposeBag = DisposeBag()
    var messages = Variable([CustomData]())
    var sections = Variable([SectionOfMessages]())
    var dataSource: RxTableViewSectionedReloadDataSource<SectionOfMessages>!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.dataSource = nil
        tableView?.register(MessageTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView?.separatorStyle = .none
        self.isKeyboardPanningEnabled = true
        // Do any additional setup after loading the view.
        conftable()
        getSections()
    }
    
    override class func tableViewStyle(for decoder: NSCoder) -> UITableViewStyle {
        
        return .plain
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func didPressRightButton(_ sender: Any?) {
        guard var text = textView.text else { return }
        text = text.trimmingCharacters(in: .whitespacesAndNewlines)
        if text.isEmpty { return; }
        messages.value.append(CustomData(message: text, send: Date()))
       
        super.didPressRightButton(sender)
    }
    
    func conftable() -> Void {
        dataSource = RxTableViewSectionedReloadDataSource<SectionOfMessages>(configureCell: { (ds, tv, ip, item) -> MessageTableViewCell in
            let cell = tv.dequeueReusableCell(withIdentifier: "Cell", for: ip) as! MessageTableViewCell
            cell.messageLbl.numberOfLines = 0
            
            cell.messageLbl.text = item.message
            
            cell.transform = (self.tableView?.transform)!
            if ip.row % 2 == 0 {
                cell.bubbleView.right(15).left(>=40)
                cell.changeImage()
            }else{
                cell.bubbleView.left(15).right(>=40)
                cell.changeImage(isFromSender: false)
            }
            return cell
        })
        
        dataSource.titleForFooterInSection = { ds, index in
            return ds.sectionModels[index].header.string(with: .HHmm)
        }
        
        
        sections.asObservable()
            .bind(to: (self.tableView?.rx.items(dataSource: dataSource))!)
            .disposed(by: disposeBag)
        
    }
    
    func getSections() {
        
        messages.asObservable().bind(onNext: { (messages) in
            self.sections.value = Dictionary(grouping: messages.reversed()) { (message) -> Date in
                return message.send.midnight()
                }.map({SectionOfMessages(value: $0)})
        }).disposed(by: disposeBag)
        
        
    }
}
