//
//  MenuAssistantsViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 21/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RealmSwift
import Kingfisher
var assistantId: String = {
    return UserDefaults().value(forKey: "assistantId") as? String ?? ""
}()
class MenuAssistantsViewController: UIViewController {
    private let disposeBag = DisposeBag()
    var v = MenuView()
    var viewModel: MenuAssistantViewModel!
    override func loadView() { view = v }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Asistentes"
        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.v = MenuView()
            self.view = self.v
        }
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        let input = MenuAssistantViewModel.Input(trigger: viewWillAppear, select: self.v.tableView.rx.itemSelected.asDriver(), add: self.v.addBtn.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        
        output.assistants.drive(self.v.tableView.rx.items(cellIdentifier: UITableViewCellX.reuseID, cellType: UITableViewCellX.self)) {tv, model, cell in
            cell.isSelected = false
            let url = model.0.photo?.routes[1] ?? ""
            let resize =  ResizingImageProcessor(referenceSize: CGSize(width: 44, height: 44))
            let corner = RoundCornerImageProcessor(cornerRadius: 8)
            cell.imageView?.kf.indicatorType = .activity
            cell.imageView?.kf.setImage(with: URL(string: url), options: [.processor(resize.append(another: corner)), .transition(.fade(0.4))])
            cell.imageView?.clipsToBounds = true
            cell.imageView?.contentMode = .redraw
            
            cell.textLabel?.text = model.0.name
            if model.1 {
                cell.accessoryType = .checkmark
            }else{
                cell.accessoryType = .none
            }
            }.disposed(by: disposeBag)
        output.selected.drive().disposed(by: disposeBag)
        output.added.drive(onNext: { _ in
            let navigation = UINavigationController()
            let navigator = AddAssistantNavigator(service: NetUseCaseProvider(), nc: navigation)
            navigator.toMain()
            navigation.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.present(navigation, animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
