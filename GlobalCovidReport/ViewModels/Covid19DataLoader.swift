//
//  Covid19DataLoader.swift
//  GlobalCovidReport
//
//  Created by Yanuar Tanzil on 19/07/20.
//  Copyright © 2020 Januar Tanzil. All rights reserved.
//

import Foundation

public enum SortCategory: String, Equatable, CaseIterable {
    case country = "Country"
    case cases = "Cases"
    case recovered = "Recovered"
   //Hint: Uncomment me! case deaths = "Deaths"
    var label: String { rawValue }
}


public class Covid19DataLoader: ObservableObject {
    @Published var listDataByCountry: [Covid19DataCountry] = [Covid19DataCountry]()
    private var sortCategoryValue: SortCategory = .country
    public var sortCategory: SortCategory {
        get{
            return sortCategoryValue
        }
        set(category){
            sortCategoryValue = category
            sortBy(sortBy: category)
        }
    }
    
    init() {
        load()
    }
    
    func load() {
        let api = CoronaAPI() //use CoronaAPICache for test
        
        api.loadData(callback: { (data) in
            print(String(decoding: data, as: UTF8.self))
            let decoder = APIDecoder()
            let apiResult = decoder.decode(covidData: data)
            
            //always publish on main thread from background thread
            DispatchQueue.main.async {
                self.listDataByCountry = [Covid19DataCountry]()
                for country in apiResult!.countries {
                    self.listDataByCountry.append(Covid19DataCountry(id: UUID().hashValue, country: country.country, totalConfirmed: country.totalConfirmed, totalDeaths: country.totalDeaths, totalRecovered: country.totalRecovered))
                }
            }
        })
    }
    
    func sortBy(sortBy: SortCategory) {
        listDataByCountry.sort(by: {(country1, country2) -> Bool in
            switch sortBy {
            /*Hint: Uncomment me! case .deaths:
                return country1.totalDeaths > country2.totalDeaths*/
            case .recovered:
                return country1.totalRecovered > country2.totalRecovered
            case .cases:
                return country1.totalConfirmed > country2.totalConfirmed
            default:
                return country1.country < country2.country
            }
        })
        
    }
    
    
}
