//
//  SearchUserViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 22/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Contacts
import ContactsUI

final class SearchUserViewModel: ViewModelType {
    let userUseCase: UserUseCase!
    let navigator: SearchUserNavigator!
    var contacts : [String] = []
    
    init(userUseCase: UserUseCase, navigator: SearchUserNavigator) {
        self.userUseCase = userUseCase
        self.navigator = navigator
        getContacts()
    }
    func transform(input: SearchUserViewModel.Input) -> SearchUserViewModel.Output {
        let users = input.trigger.flatMapLatest { _ -> SharedSequence<DriverSharingStrategy, [User]> in
            return self.userUseCase
                .getUsers(phones: self.contacts, rol: 0)
                .asDriverOnErrorJustComplete()
        }
        let back = input.backTrigger.do(onNext:  {self.navigator.toBack()})
        
        return Output(users: users.asDriver(), back: back)
    }
    
    func getContacts() -> Void {
        let store = CNContactStore()
        let fetchRequest = CNContactFetchRequest(keysToFetch: [CNContactGivenNameKey as CNKeyDescriptor, CNContactFamilyNameKey as CNKeyDescriptor, CNContactPhoneNumbersKey as CNKeyDescriptor])
        try! store.enumerateContacts(with: fetchRequest) { contact, stop in
            if contact.phoneNumbers.count > 0{
                for phone in contact.phoneNumbers {
                    if let number = phone.value.value(forKey: "digits") as? String, number.count == 10 {
                         self.contacts.append(number)
                    }
                }
            }
        }
    }
}

extension SearchUserViewModel {
    struct Input {
        let trigger: Driver<Void>
        let backTrigger: Driver<Void>
    }
    struct Output {
        let users: Driver<[User]>
        let back: Driver<Void>
    }
}

