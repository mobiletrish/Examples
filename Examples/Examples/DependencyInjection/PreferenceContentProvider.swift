//
//  PreferencesContentProvider.swift
//  Examples
//
//  Created by Patricia Fulk on 2/7/23.
//

import Foundation
import Combine

protocol PreferenceContentProviderProtocol: ObservableObject {
    var displayHeader: Bool { get }
    var displaySummary: Bool { get }
    var displayFooter: Bool { get }
    var summaryBackgroundColor: ColorSelection { get }
}

final class PreferenceContentProvider<Store>: PreferenceContentProviderProtocol where Store: PreferenceStoreProtocol {
    private var store: Store
    private var cancellables: Set<AnyCancellable> = []

    init(
        store: Store = DIContainer.instance.get(type: Store.self)!
    ){
        self.store = store

        store.objectWillChange.sink { _ in
          self.objectWillChange.send()
        }
        .store(in: &cancellables)
    }
    
    var displayHeader: Bool {
        store.headerPreference
    }

    var displaySummary: Bool {
        store.summaryPreference
    }

    var displayFooter: Bool {
        store.footerPreference
    }

    var summaryBackgroundColor: ColorSelection {
        store.summaryBackgroundColorPreference
    }
}
