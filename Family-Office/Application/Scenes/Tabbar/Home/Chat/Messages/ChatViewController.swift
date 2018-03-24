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
import RxGesture
import Stevia
import Lightbox

struct SectionOfMessages {
    var header: headerChatView
    var items: [Item]
    init(value: (key: Date, value: [Item])) {
        let v = headerChatView()
        v.title.text = value.key.string(with: .MMMyyyy)
        self.header = v
        self.items = value.value
    }
}

extension SectionOfMessages: SectionModelType {
    typealias Item = ChatMessage
    
    init(original: SectionOfMessages, items: [Item]) {
        self = original
        self.items = items
    }
}


class ChatViewController: SLKTextViewController {
    private var disposeBag = DisposeBag()
    private var messages = [SectionOfMessages]()
    /// Fotos que se visualizarán al dar click
    private var photos = [AttachmentViewModel]()
    /// indexpath que nos ayudará a redirigir al mensaje de la ultima foto vista
    private var indexPath: IndexPath! = nil
    
    var viewModel: ChatViewModel!
    var dataSource: RxTableViewSectionedReloadDataSource<SectionOfMessages>!
    
    let infoView = titleView()
    
    fileprivate func setupView() {
        conftable()
        self.leftButton.setImage(#imageLiteral(resourceName: "icons8-camera"), for: UIControlState())
        self.leftButton.tintColor = #colorLiteral(red: 0.1788346171, green: 0.3957612514, blue: 0.5594384074, alpha: 1)
        self.navigationItem.leftBarButtonItem = self.backBtn
        self.navigationItem.titleView = infoView
        self.navigationItem.titleView?.isUserInteractionEnabled = true
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView?.delegate = self
        self.tableView?.dataSource = nil
        tableView?.register(MessageTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView?.separatorStyle = .none
        self.isKeyboardPanningEnabled = true
        // Do any additional setup after loading the view.
        self.tableView?.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.setupView()
        }
        self.tabBarController?.tabBar.isHidden = true
        setupView()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        bindToView()
        if indexPath != nil {
            self.tableView?.scrollToRow(at: indexPath, at: .none, animated: true)
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
         self.tabBarController?.tabBar.isHidden = false
         NetUseCaseProvider().makeChatUseCase().seenToChat(id: viewModel.chat.uid).asDriverOnErrorJustComplete().drive().disposed(by: disposeBag)
         disposeBag = DisposeBag()
         self.indexPath = nil
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
            let cell = MessageTableViewCell(style: .default, reuseIdentifier: "Cell")
            cell.messageText.numberOfLines = 0
            cell.bind(message: item)
            cell.transform = (self.tableView?.transform)!
            cell.isFromSender(isMe: item.sender?.uid == me)
            cell.bindToView(chatId: self.viewModel.chat.uid)
            return cell
        })
        dataSource.titleForFooterInSection = { ds, index in
            return ""
        }
    }
    
    func bindToView() -> Void {
        let text = self.textView.rx.text
            .orEmpty
            .asDriver()
        let tapTitle = self.navigationController?.navigationBar.rx.tapGesture().when(.recognized).asDriverOnErrorJustComplete().mapToVoid()
        let tap = rx.methodInvoked(#selector(self.didPressRightButton))
            .asDriverOnErrorJustComplete()
            .mapToVoid()
        
        let willAppear = rx.methodInvoked(#selector(self.viewDidAppear(_:)))
            .asDriverOnErrorJustComplete()
            .mapToVoid()
        
        let tapCamera = leftButton.rx.tap.asDriver()
        let input = ChatViewModel.Input(willAppear: willAppear, textChange: text, sendMessage: tap, tapCameraTrigger: tapCamera, selectInfo: tapTitle!, selectCell: self.tableView!.rx.itemSelected.asDriver() )
        
        let output = viewModel.transform(input: input)
        
        output.messages
            .drive((self.tableView?.rx.items(dataSource: dataSource))!)
            .disposed(by: disposeBag)
        
        output.messages
            .drive(onNext: {self.messages = $0})
            .disposed(by: disposeBag)
        output.sendMessage
            .drive(onNext: {_ in
                self.tableView?.slk_scrollToTop(animated: true)
            })
            .disposed(by: disposeBag)
        
        output.messageChange.drive().disposed(by: disposeBag)
        
        output.tapCamera.drive(onNext: { _ in
            self.selectImage(completion: { (image) in
                if image != nil {
                    if let aux: Data = (image)?.resizeImage().jpeg(.high)! {
                        self.viewModel.sendMessage(data: aux).drive().dispose()
                        self.textView.text = ""
                    }
                }
            })
        }).disposed(by: disposeBag)
        
        output.selectCell.drive(onNext: { arg in
            self.photos = arg.1
            let images = arg.1.map({LightboxImage(imageURL: $0.message.attachment!.getUrlWithToken(type: 0), text: $0.message.text, videoURL: nil)})
        
            if !images.isEmpty {
                let controller = LightboxController(images: images)
                controller.pageDelegate = self
                // Use dynamic background.
                controller.dynamicBackground = true
                // Present your controller.
                self.present(controller, animated: true, completion: nil)
                let index = arg.1.index(where: {$0.message.uid == arg.0})!
                controller.goTo(index)
            }
        }).disposed(by: disposeBag)
        
        infoView.isUserInteractionEnabled = true
        output.selectedInfo.drive().disposed(by: disposeBag)
        infoView.bind(chat: viewModel.chat)
        infoView.title.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

    }
  
}
extension ChatViewController: LightboxControllerPageDelegate {
  
   
    /// Nos ayudará a encontrar el indexPath del mensaje en la foto que se esta viendo al momento
    ///
    /// - Parameters:
    ///   - controller: LighBoxController
    ///   - page: int
    func lightboxController(_ controller: LightboxController, didMoveToPage page: Int) {
        let uid = photos[page].message.uid
        self.messages.enumerated().forEach { (i, section) in
            if let row = section.items.index(where: {$0.uid == uid}) {
                self.indexPath = IndexPath(row: row, section: i)
            }
        }
    }
    
}
