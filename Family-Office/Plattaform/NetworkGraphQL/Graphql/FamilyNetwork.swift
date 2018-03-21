//
//  FamilyNetwork.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import Apollo

public final class FamilyNetwork {
    private let network: Network<Family>

    init(network: Network<Family>) {
        self.network = network
    }

    public func createFamily(family: Family) -> Observable<Family> {
        return network.postItem(CreateFamilyMutation(name: family.name))
    }
    
    func myFamilies() -> Observable<[Family]> {
        return network.getItems(MyFamiliesQuery())
    }
    
    func edit(family: Family, photo: Data?) -> Observable<Family> {
        let mutation = EditFamilyMutation(fid: family.uid, name: family.name, file: nil)
        if let data = photo {
            let id = UUID().uuidString
            let file = GraphQLFile(fieldName: "file", originalName: "\(id).jpeg", mimeType: "image/jpeg", data: data)
            return network.postItem(mutation, files: [file])
        }else{
            return network.postItem(mutation)
        }
        
    }
}
