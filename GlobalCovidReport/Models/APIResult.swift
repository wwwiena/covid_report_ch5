//
//  APIResult.swift
//  GlobalCovidReport
//
//  Created by Yanuar Tanzil on 03/07/20.
//  Copyright © 2020 Januar Tanzil. All rights reserved.
//

import Foundation

public struct APIResult: Decodable {
    public var global: GlobalData
    public var countries: [Country]
    
    enum CodingKeys: String, CodingKey {
        case global = "Global"
        case countries = "Countries"
    }
}

public struct GlobalData: Decodable {
    public var newConfirmed: Int
    public var totalConfirmed: Int
    public var newDeaths: Int
    public var totalDeaths: Int
    public var newRecovered: Int
    public var totalRecovered: Int
    
    enum CodingKeys: String, CodingKey {
         case newConfirmed = "NewConfirmed"
         case totalConfirmed = "TotalConfirmed"
         case newDeaths = "NewDeaths"
         case totalDeaths = "TotalDeaths"
         case newRecovered = "NewRecovered"
         case totalRecovered = "TotalRecovered"
   }
}

public struct Country: Decodable {
    public var country: String
    public var countryCode: String
    public var slug: String
    public var newConfirmed: Int
    public var totalConfirmed: Int
    public var newDeaths: Int
    public var totalDeaths: Int
    public var newRecovered: Int
    public var totalRecovered: Int
  
    
    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case countryCode = "CountryCode"
        case slug = "Slug"
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
     
    }
}

public struct Covid19DataCountry: Identifiable {
    public var id: Int
    public var country: String
    public var totalConfirmed: Int
    public var totalDeaths: Int
    public var totalRecovered: Int
}
