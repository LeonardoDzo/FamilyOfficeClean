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
    let rmsolicitudeUseCase: ApplicationUseCase!
    var contacts: [String] = []
    var solicitudes = [ApplicationFamily]()

    var famiy: Family!
    init(userUseCase: UserUseCase, navigator: SearchUserNavigator, rmsolicitude: ApplicationUseCase) {
        self.userUseCase = userUseCase
        self.navigator = navigator
        self.rmsolicitudeUseCase = rmsolicitude
        getContacts()
        getSolicitudes()
    }
    func transform(input: SearchUserViewModel.Input) -> SearchUserViewModel.Output {
        let applications = input.trigger.flatMapLatest { _ -> SharedSequence<DriverSharingStrategy, [SolicitudeFamilyViewModel]> in
            return self.userUseCase
                .getUsers(phones: self.contacts, rol: 0)
                .map({ (users) -> [SolicitudeFamilyViewModel] in
                    return users.map({ (u) -> SolicitudeFamilyViewModel in
                        let isInvited = self.solicitudes.contains(where: {$0.user == u})
                        return SolicitudeFamilyViewModel(user: u, family: self.famiy, isInvited: isInvited)
                    })
                }).asDriverOnErrorJustComplete()

        }
        let back = input.backTrigger.do(onNext: {self.navigator.toBack()})

        return Output(applications: applications.asDriver(), back: back)
    }

    func getSolicitudes() {
        self.rmsolicitudeUseCase
            .getFamilyApplications()
            .asDriverOnErrorJustComplete()
            .do(onNext: { (solicitudes) in
                self.solicitudes = solicitudes
            }).drive().dispose()
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

extension SearchUserViewModel {
    struct Input {
        let trigger: Driver<Void>
        let backTrigger: Driver<Void>
    }
    struct Output {
        let applications: Driver<[SolicitudeFamilyViewModel]>
        let back: Driver<Void>
    }
}
