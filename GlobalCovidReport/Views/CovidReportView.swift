//
//  CovidReportView.swift
//  GlobalCovidReport
//
//  Created by Yanuar Tanzil on 19/07/20.
//  Copyright © 2020 Januar Tanzil. All rights reserved.
//

import SwiftUI

struct CovidReportView: View {
    @ObservedObject var covidLoader: Covid19DataLoader
    
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                Text("There are \(covidLoader.listDataByCountry.count) countries, sorted by :")
                
                Spacer(minLength: 10)
                
                Picker("", selection: $covidLoader.sortCategory){
                    ForEach(SortCategory.allCases, id: \.self) {
                        Text($0.label)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                Spacer().foregroundColor(Color.gray).frame(height: 10)
                
                List(covidLoader.listDataByCountry) { dataPerCountry in
                    VStack(alignment: .leading) {
                        Text(dataPerCountry.country).font(.title).foregroundColor(Color.gray)//Hint: Uncomment me!//.bold()
                        HStack {
                            Text("Total Confirmed Cases: ").frame(maxWidth: .infinity, alignment: Alignment.leading)
                            Text("\(dataPerCountry.totalConfirmed)").foregroundColor(Color.yellow)
                        }
                        HStack {
                            Text("Total Deaths: ").frame(maxWidth: .infinity, alignment: Alignment.leading)
                            Text("\(dataPerCountry.totalDeaths)").foregroundColor(Color.red)
                        }
                        HStack {
                            Text("Total Recovered: ").frame(maxWidth: .infinity, alignment: Alignment.leading)
                            Text("\(dataPerCountry.totalRecovered)").foregroundColor(Color.green)
                        }
                    }//Hint: Uncomment me!//.background(dataPerCountry.totalConfirmed > 100000 ? Color.red : Color.white)
                }
                
            }.navigationBarTitle("Covid-19 by Country")
        }
    }
}

struct CovidReportView_Previews: PreviewProvider {
    static var previews: some View {
        CovidReportView(covidLoader: Covid19DataLoader())
    }
}
