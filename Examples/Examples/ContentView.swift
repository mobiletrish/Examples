//
//  ContentView.swift
//  Examples
//
//  Created by Patricia Fulk on 1/30/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List {
                NavigationLink(
                    destination: Text("Detail"),
                    label: {
                        Text("Dependency Injection").font(.body)
                    })
            }
            .navigationTitle("Examples")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
