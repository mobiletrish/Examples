//
//  ExamplesApp.swift
//  Examples
//
//  Created by Patricia Fulk on 1/30/23.
//

import SwiftUI

@main
struct ExamplesApp: App {
    init() {
        DIContainer.instance.add(type: ColorSelection.self, dicomponent: ColorSelection.blue)
        DIContainer.instance.add(type: PreferenceStore.self, dicomponent: PreferenceStore())
        DIContainer.instance.add(type: PreferenceContentProvider<PreferenceStore>.self, dicomponent: PreferenceContentProvider<PreferenceStore>())
    }
   var body: some Scene {
        WindowGroup {
            AccountView<PreferenceContentProvider<PreferenceStore>>()
        }
    }
}
