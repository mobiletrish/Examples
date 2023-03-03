//
//  AccountView.swift
//  Examples
//
//  Created by Patricia Fulk on 1/31/23.
//

import SwiftUI

struct AccountView<ContentProvider>: View where ContentProvider: PreferenceContentProviderProtocol {
    
    @ObservedObject private var provider: ContentProvider
    
    init(provider: ContentProvider = DIContainer.instance.get(type: ContentProvider.self)!)
    {
        self.provider = provider
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    HeaderView(display: provider.displayHeader)
                    BodyView(display: provider.displaySummary, backgroundColor: provider.summaryBackgroundColor)
                    FooterView(display: provider.displayFooter)
                }
            }
            .navigationTitle("View Display")
            .navigationBarItems(trailing: Button(action: {}){
                NavigationLink(destination: PreferenceView<PreferenceStore>()){
                    Image(systemName: "gear")
                }
            })
        }
    }
}

struct HeaderView: View {
    private let displayHeader: Bool

    init(display: Bool){
        self.displayHeader = display
    }
    
    var body: some View {
        VStack {
            if displayHeader {
                HStack{
                    Text("Header").font(.title2)
                }
            }
            Spacer()
        }.padding()
    }
}

struct BodyView: View {
    private let displayHeader: Bool
    private let backgroundColor: Color
    
    init(display: Bool, backgroundColor: ColorSelection){
        self.displayHeader = display
        self.backgroundColor = backgroundColor.color
    }

    var body: some View {
        VStack {
            if displayHeader {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Text("Body").font(.body)
                    }
                }
            }
        }
        .padding()
        .background(backgroundColor)
    }
}

struct FooterView: View {
    private let displayHeader: Bool

    init(display: Bool){
        self.displayHeader = display
    }

    var body: some View {
        VStack(alignment: .leading) {
            if displayHeader {
                Spacer().frame(maxWidth: .infinity)
                Text("Footer").font(.footnote)
            }
        }.padding()
    }
}


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView<PreferenceContentProvider<PreferenceStore>>()
    }
}
