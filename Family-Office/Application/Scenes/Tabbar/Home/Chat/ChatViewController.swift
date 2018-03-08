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
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView?.separatorStyle = .none
        self.isKeyboardPanningEnabled = true
        // Do any additional setup after loading the view.
        conftable()
        
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
        sections.value = getSections()
        super.didPressRightButton(sender)
    }
    
    func conftable() -> Void {
        dataSource = RxTableViewSectionedReloadDataSource<SectionOfMessages>(configureCell: { (ds, tv, ip, item) -> UITableViewCell in
            let cell = tv.dequeueReusableCell(withIdentifier: "Cell", for: ip)
            cell.textLabel?.attributedText = self.makeAttributedString(title: "Leonardo Durazo \(item.send.string(with: .HHmm))", subtitle: item.message)
            cell.transform = (self.tableView?.transform)!
//            cell.draw(cell.frame)
            return cell
        })
        
        dataSource.titleForFooterInSection = { ds, index in
            return ds.sectionModels[index].header.string(with: .HHmm)
        }
        
        
        sections.asObservable()
            .bind(to: (self.tableView?.rx.items(dataSource: dataSource))!)
            .disposed(by: disposeBag)
        
    }
    
    func getSections() -> [SectionOfMessages] {
        return Dictionary(grouping: messages.value) { (message) -> Date in
            return message.send.midnight()
            }.map({SectionOfMessages(value: $0)})
    }
    func makeAttributedString(title: String, subtitle: String) -> NSAttributedString {
        let titleAttributes = [NSAttributedStringKey.font: UIFont.preferredFont(forTextStyle: .headline), NSAttributedStringKey.foregroundColor: UIColor.purple]
        let subtitleAttributes = [NSAttributedStringKey.font: UIFont.preferredFont(forTextStyle: .subheadline)]
        
        let titleString = NSMutableAttributedString(string: "\(title)\n", attributes: titleAttributes)
        let subtitleString = NSAttributedString(string: subtitle, attributes: subtitleAttributes)
        
        titleString.append(subtitleString)
        
        return titleString
    }
}
