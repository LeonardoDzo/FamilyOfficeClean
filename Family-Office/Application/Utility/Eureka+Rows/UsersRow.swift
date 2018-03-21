//
//  UsersRow.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 20/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Eureka
import UIKit
import RealmSwift
import RxSwift
import RxCocoa
import Kingfisher
public struct UserListSelected : Equatable {
    
    public var list = [String]()
    
    public static func ==(lhs: UserListSelected, rhs: UserListSelected) -> Bool {
        if lhs.list.count != rhs.list.count  {
            return false
        }
        // get count of the matched items
        let result = zip(lhs.list, rhs.list).enumerated().filter() {
            $1.0 == $1.1
            }.count
        
        if result == lhs.list.count {
            return true
        }
        
        return false
        
    }
    public var description: String {
        return "\(list.count)"
    }
    
}

public final class UsersRow: OptionsRow<PushSelectorCell<UserListSelected>>, PresenterRowType, RowType {
    
    public typealias PresenterRow = UsersController
    
    /// Defines how the view controller will be presented, pushed, etc.
    open var presentationMode: PresentationMode<PresenterRow>?
    
    /// Will be called before the presentation occurs.
    open var onPresentCallback: ((FormViewController, PresenterRow) -> Void)?
    
    open var familyId: String?
    
    public required init(tag: String?) {
        super.init(tag: tag)
        presentationMode = .show(controllerProvider: ControllerProvider.callback { return UsersController(){ _ in } }, onDismiss: { vc in _ = vc.navigationController?.popViewController(animated: true) })
        
        displayValueFor = {
            guard let users = $0 else { return "0" }
            return  users.description
        }
    }
    
    /**
     Extends `didSelect` method
     */
    open override func customDidSelect() {
        super.customDidSelect()
        guard let presentationMode = presentationMode, !isDisabled else { return }
        if let controller = presentationMode.makeController() {
            controller.row = self
            controller.title = selectorTitle ?? controller.title
            onPresentCallback?(cell.formViewController()!, controller)
            presentationMode.present(controller, row: self, presentingController: self.cell.formViewController()!)
        } else {
            presentationMode.present(nil, row: self, presentingController: self.cell.formViewController()!)
        }
    }
    
    /**
     Prepares the pushed row setting its title and completion callback.
     */
    open override func prepare(for segue: UIStoryboardSegue) {
        super.prepare(for: segue)
        guard let rowVC = segue.destination as? PresenterRow else { return }
        rowVC.title = selectorTitle ?? rowVC.title
        rowVC.onDismissCallback = presentationMode?.onDismissCallback ?? rowVC.onDismissCallback
        onPresentCallback?(cell.formViewController()!, rowVC)
        rowVC.row = self
    }
}
public class UsersController : UIViewController, TypedRowControllerType, UITableViewDataSource, UITableViewDelegate {
    private var users = [User]()
    private let disposeBag = DisposeBag()
    public var row: RowOf<UserListSelected>!
    let viewModel = UsersRowsViewModel()
    public var onDismissCallback: ((UIViewController) -> ())?
    
    var userList = UserListSelected()
    
    private var tableView: UITableView!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience public init(_ callback: ((UIViewController) -> ())?){
        self.init(nibName: nil, bundle: nil)
        onDismissCallback = callback
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        userList = row.value ?? UserListSelected()
        
        if !userList.list.contains(me) {
            userList.list.append(me)
        }
        
        tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        tableView.register(UITableViewCellX.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.tappedDone(_:)))
        button.title = "Done"
        navigationItem.rightBarButtonItem = button
        tableView.isMultipleTouchEnabled = true
        self.view.addSubview(tableView)
        
        bindViewModel()
    }
    
    func bindViewModel() -> Void {
        let willAppear = rx.methodInvoked(#selector(self.viewWillAppear(_:)))
            .asDriverOnErrorJustComplete()
            .mapToVoid()
        let input = UsersRowsViewModel.Input(trigger: willAppear)
        let output = viewModel.transform(input: input)
        
        output.users.drive(onNext: {
            self.users = $0
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        //        self.navigationController?.setToolbarHidden(false, animated: true)
        //        self.tabBarController?.tabBar.isHidden = true
        //        self.navigationController?.tabBarController?.tabBar.isHidden = true
    }
    public override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userid = users[indexPath.row].uid
        if let index = userList.list.index(where: {$0 == userid}) {
            userList.list.remove(at: index)
        }else{
            userList.list.append(userid)
        }
        self.tableView.reloadData()
        
    }
    
    @objc func tappedDone(_ sender: UIBarButtonItem){
        if userList != row.value {
            row.value = userList
            onDismissCallback?(self)
        }
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let familyMemberId = users[indexPath.row].uid
        if familyMemberId == me { return nil }
        return indexPath
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let user =  users[indexPath.row]

        cell.textLabel?.text = user.name
        cell.imageView?.kf.setImage(with: URL(string: user.photo?.routes[1] ?? ""))

        if userList.list.contains(user.uid){
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        return cell
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
}

