//
//  AddAssistantViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 26/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Contacts
import ContactsUI

final class AddAssistantViewModel: ViewModelType {
    var contacts: [String] = []
    let userUseCase: UserUseCase!
    let navigator: AddAssistantNavigator!
    var applications = [ApplicationAssistant]()
    
    init(userUseCase: UserUseCase, navigator: AddAssistantNavigator, applications: [ApplicationAssistant]) {
         self.userUseCase = userUseCase
         self.navigator = navigator
         self.applications = applications
         getContacts()
    }
    func transform(input: AddAssistantViewModel.Input) -> AddAssistantViewModel.Output {
        let applications = input.trigger.flatMapLatest { _ -> SharedSequence<DriverSharingStrategy, [User]> in
            return self.userUseCase
                .getUsers(phones: self.contacts, rol: 1)
                .asDriverOnErrorJustComplete()
                .map({ (users) -> [User] in
                    if self.applications.isEmpty {
                        return users
                    }
                    return users.filter { user in
                        return self.applications.contains(where: { $0.assistant != user })
                    }
                })
        }
        let back = input.back.do(onNext: {self.navigator.toBack()})
        return Output(assistants: applications, back: back)
    }
    func getContacts() {
        let store = CNContactStore()
        let fetchRequest = CNContactFetchRequest(keysToFetch: [CNContactGivenNameKey as CNKeyDescriptor, CNContactFamilyNameKey as CNKeyDescriptor, CNContactPhoneNumbersKey as CNKeyDescriptor])
        try! store.enumerateContacts(with: fetchRequest) { contact, stop in
            if contact.phoneNumbers.count > 0 {
                for phone in contact.phoneNumbers {
                    if let number = phone.value.value(forKey: "digits") as? String, number.count == 10 {
                        self.contacts.append(number)
                    }
                }
            }
        }
    }
}
extension AddAssistantViewModel {
    struct Input {
        let trigger: Driver<Void>
        let back: Driver<Void>
    }
    struct Output {
        let assistants: Driver<[User]>
        let back: Driver<Void>
    }
}
