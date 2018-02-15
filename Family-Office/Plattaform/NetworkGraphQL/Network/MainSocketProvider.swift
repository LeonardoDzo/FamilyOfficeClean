//
//  MainSocketProvider.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 13/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import ActionCableClient
import Starscream
import RealmSwift
final class MainSocket {
    var request = URL(string:"ws://localhost:3000/websocket")!
    var client : ActionCableClient!
    var channel : Channel!
    static let shareIntstance = MainSocket()
    private init() {
        if let token = UserDefaults().value(forKey: "token") as? String {
            client = ActionCableClient(url: request)
            client.headers = ["Authorization": token]
            self.channel = self.client.create("GraphqlChannel")
            client.onConnected = {
                print("conectado!\n")
               
                self.channel.onReceive = { (JSON: Any?, error : Error?) in
                    print("Received", JSON ?? "empty json", error ?? "no error")
                    
                    if let dic = JSON as? Dictionary<String,Any> {
                        if let result = dic["result"] as? Dictionary<String,Any>, let json = result["data"] as? Dictionary<String,Any> {
                            guard let data = json.jsonToData() else {
                                return
                            }
                            let key = json.keys.first  ?? ""
                            
                            switch key {
                                case "userChanged":
                                    if let user = FindObject<User>().decoder(data: data) {
                                      RMUseCaseProvider().makeUseCase().save(user: user).subscribe().dispose()
                                    }
                                    break
                                default:
                                    break
                            }
                        }
                    }
                }
              
                self.channel.onSubscribed = {
                    print("Subscribed")
                }
                
                self.channel.onUnsubscribed = {
                    print("Unsubscribed")
                }
                
                self.channel.onRejected = {
                    print("rejected")
                }
                
                            }
            
            client.onDisconnected = { (error) in
                print("asldknaslk")
                print(error?.localizedDescription ?? "desconectado")
                self.client.connect()
            }
            
            client.connect()
        }
        
    }
    
}
