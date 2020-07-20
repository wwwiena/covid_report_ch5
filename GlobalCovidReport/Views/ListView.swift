//
//  ListView.swift
//  GlobalCovidReport
//
//  Created by Yanuar Tanzil on 05/07/20.
//  Copyright © 2020 Januar Tanzil. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    var body: some View {
        List {
            Section(header: Text("Header 1")) {
                Text("Hello world")
                Text("Hello world")
                Text("Hello world")
            }
            Section(header: Text("Header 2")) {
                Text("Hello world")
                Text("Hello world")
                Text("Hello world")
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
