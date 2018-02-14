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
