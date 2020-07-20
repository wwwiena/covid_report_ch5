//
//  CoronaAPI.swift
//  GlobalCovidReport
//
//  Created by Yanuar Tanzil on 08/07/20.
//  Copyright © 2020 Januar Tanzil. All rights reserved.
//

import Foundation

protocol APIProtocol {
    
    func loadData(callback: @escaping (Data) -> Void)
    
}

public class CoronaAPI: APIProtocol {
    
    func loadData(callback: @escaping (Data) -> Void) {
        let url = URL(string: "https://api.covid19api.com/summary")!
        let urlSession = URLSession.shared.dataTask(with: url) { (data, _, error) in
           if let todoData = data {
                callback(todoData)
           } else {
               print("No data from API \(error!.localizedDescription)")
           }
        }
        urlSession.resume()
    }

}

class CoronaAPICache: APIProtocol { //reads from cache (JSON docs for now)
    
    func loadData(callback: @escaping (Data) -> Void) {
        do {
            if let bundlePath = Bundle.main.path(forResource: "apiresult", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8, allowLossyConversion: false) {
                    callback(jsonData)
            }
        } catch {
            print("Can't read local cache")
        }
        
    }

}
