//
//  ContentView.swift
//  GlobalCovidReport
//
//  Created by Yanuar Tanzil on 03/07/20.
//  Copyright © 2020 Januar Tanzil. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var arrayTips: [Double] = [0, 10, 25, 30, 40]
    @State private var selectedValue: Double = 0
    @State private var peopleCount = 0
    @State private var tipPercentage = 2
    @State private var checkAmount = ""
    
    private var billAmount: Double{
        print(selectedValue)
        print(peopleCount)
        return (Double(selectedValue / 100.0) * (Double(checkAmount) ?? 0)) / Double(peopleCount + 1)
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Check amount", text: $checkAmount).keyboardType(.decimalPad)
                    Picker("Amount of people :", selection: $peopleCount){
                        ForEach(0..<10){
                            Text("\($0 + 1) person")
                        }
                    }
                    Picker("Amount of tips:", selection: $selectedValue){
                        ForEach(arrayTips, id: \.self){ tip in
                            Text("\(tip, specifier:"%.0f")%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("This is your bill : \(billAmount, specifier:"%.2f")")
                }
            }.navigationBarTitle(Text("Count your bills"), displayMode: .automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{           ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max")).previewDisplayName("iPhone 11 Pro Max")
        }
    }
}
