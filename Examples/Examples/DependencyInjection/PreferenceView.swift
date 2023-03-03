//
//  PreferenceView.swift
//  Examples
//
//  Created by Patricia Fulk on 2/6/23.
//

import SwiftUI

struct PreferenceView<Store>: View where Store: PreferenceStoreProtocol {

    private var summaryTitle: String = "Background color for summary:"
    
    @ObservedObject private var store: Store
    
    init(store: Store = DIContainer.instance.get(type: Store.self)!){
        self.store = store
    }
    
    var body: some View {
      NavigationView {
          VStack(alignment: .leading, spacing: 20) {
            Toggle("Display Header", isOn: $store.headerPreference)
            Toggle("Display Summary", isOn: $store.summaryPreference)
            Toggle("Display Footer", isOn: $store.footerPreference)
            
            Divider()
            HStack{
                Text(summaryTitle)
                MenuView(title: store.summaryBackgroundColorPreference.title) { value in
                    store.summaryBackgroundColorPreference = value
                }
            }
            Spacer()
          }.padding()
      }.navigationBarTitle("Preferences")
    }
}

struct PreferenceView_Previews: PreviewProvider {
  static var previews: some View {
      PreferenceView(store: PreferenceStore())
  }
}

struct MenuView: View {
    @State var title: String
    private let onPreferenceChange: (ColorSelection) -> Void
    
    init(title: String, onPreferenceChange: @escaping (ColorSelection) -> Void) {
        _title = State<String>(initialValue: title)
        self.onPreferenceChange = onPreferenceChange
    }
    
    var body: some View {
        Menu(title){
            Button(ColorSelection.blue.title){
                onPreferenceChange(ColorSelection.blue)
                title = ColorSelection.blue.title
            }
            Button(ColorSelection.red.title){
                onPreferenceChange(ColorSelection.red)
                title = ColorSelection.red.title
            }
            Button(ColorSelection.green.title){
                onPreferenceChange(ColorSelection.green)
                title = ColorSelection.green.title
            }
            Button(ColorSelection.yellow.title){
                onPreferenceChange(ColorSelection.yellow)
                title = ColorSelection.yellow.title
            }        }
    
    }
}
