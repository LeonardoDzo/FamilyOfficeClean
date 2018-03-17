//
//  MessageViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 16/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

final class MessageViewModel: ViewModelType {
    let message: ChatMessage!
    let chatId: String!
    let chatUseCase  = RMUseCaseProvider().makeChatUseCase()
    
    init(message: ChatMessage, chatId: String) {
        self.message = message
        self.chatId = chatId
    }
    func transform(input: MessageViewModel.Input) -> MessageViewModel.Output {
        let selected = input.tap.do(onNext: { args in
            
            if let img = args.1 {
                let imageToShare = [img]
                
                let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
                
                
                // exclude some activity types from the list (optional)
                activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
                
                if let top = UIApplication.topViewController() {
                    top.present(activityViewController, animated: true, completion: nil)
                }
            }
            
            
            
        }).mapToVoid()
        return Output(tapped: selected)
    }
    
}
extension MessageViewModel {
    struct Input {
        let tap: Driver<(Void, UIImage?)>
    }
    struct Output {
        let tapped: Driver<Void>
    }
}
