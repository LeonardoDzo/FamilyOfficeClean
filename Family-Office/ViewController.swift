//
//  ViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 25/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Apollo
class ViewController: UIViewController {
    let apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        // Add additional headers as needed
        configuration.httpAdditionalHeaders = ["Authorization": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.Je9hdoQJfm_FSRIeG0jzCNf_42goiPQHQG-v7nhJML4"] // Replace `<token>`
        let url = URL(string: "http://192.168.1.112:3000/graphql")!
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

