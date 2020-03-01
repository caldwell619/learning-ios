//
//  Service.swift
//  http-requests
//
//  Created by Chris Caldwell on 2/8/20.
//  Copyright © 2020 Chris Caldwell. All rights reserved.
//

import UIKit

class Service: NSObject {
    static let shared = Service()
    
    
    func fetchItems(completion: () -> ()){
        let session = URLSession.shared
        guard let url = URL(string: "http://localhost:5000/dynamo/get-item") else {return }
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("json", json)
                completion(.success(json))
            } catch {
                completion(.failure())
                print("JSON error: \(error.localizedDescription)")
            }
        })
        
        task.resume()
    }
}
