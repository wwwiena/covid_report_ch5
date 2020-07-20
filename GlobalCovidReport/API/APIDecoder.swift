//
//  APIEncoder.swift
//  GlobalCovidReport
//
//  Created by Yanuar Tanzil on 08/07/20.
//  Copyright © 2020 Januar Tanzil. All rights reserved.
//

import Foundation

class APIDecoder {
    func decode(covidData: Data) -> APIResult? {
        var decodedData: APIResult?
        do {
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            decodedData = try decoder.decode(APIResult.self, from: covidData)
        } catch  {
            print("Can't decode \(error)")
        }
        return decodedData
    }
}
