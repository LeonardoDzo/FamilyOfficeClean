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


struct SectionOfMessages {
    var header: Date
    var items: [Item]
    init(value: (key: Date, value: [Item])) {
        self.header = value.key
        self.items = value.value
    }
}

extension SectionOfMessages: SectionModelType {
    typealias Item = MockMessage
    
    init(original: SectionOfMessages, items: [Item]) {
        self = original
        self.items = items
    }
}


class ChatViewController: SLKTextViewController {
    private let disposeBag = DisposeBag()
    
    var viewModel: ChatViewModel!
    var dataSource: RxTableViewSectionedReloadDataSource<SectionOfMessages>!
    
    fileprivate func setupView() {
        conftable()
        bindToView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.dataSource = nil
        tableView?.register(MessageTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView?.separatorStyle = .none
        self.isKeyboardPanningEnabled = true
        // Do any additional setup after loading the view.
        self.tableView?.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.setupView()
        }
        setupView()
    }
    
    override class func tableViewStyle(for decoder: NSCoder) -> UITableViewStyle {
        return .plain
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func conftable() -> Void {
        dataSource = RxTableViewSectionedReloadDataSource<SectionOfMessages>(configureCell: { (ds, tv, ip, item) -> MessageTableViewCell in
            let cell = tv.dequeueReusableCell(withIdentifier: "Cell", for: ip) as! MessageTableViewCell
            cell.messageText.numberOfLines = 0
            cell.transform = (self.tableView?.transform)!
            cell.bind(message: item)
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

    }
    
    func bindToView() -> Void {
        
        let text = self.textView.rx.text
            .orEmpty
            .asDriver()
        let tap = rx.methodInvoked(#selector(self.didPressRightButton))
            .asDriverOnErrorJustComplete()
            .mapToVoid()
        
        let willAppear = rx.methodInvoked(#selector(self.viewWillAppear))
            .asDriverOnErrorJustComplete()
            .mapToVoid()
        
        let input = ChatViewModel.Input(willAppear: willAppear, textChange: text, sendMessage: tap )
        
        let output = viewModel.transform(input: input)
        
        output.messages
            .drive((self.tableView?.rx.items(dataSource: dataSource))!)
            .disposed(by: disposeBag)
        
        output.sendMessage
            .drive()
            .disposed(by: disposeBag)
        
        output.messageChange.drive().disposed(by: disposeBag)
        
    }
    
  
}
