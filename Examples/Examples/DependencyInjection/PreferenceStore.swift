//
//  PreferenceStore.swift
//  Examples
//
//  Created by Patricia Fulk on 2/7/23.
//

import Foundation
import SwiftUI

protocol PreferenceStoreProtocol: ObservableObject {
  var headerPreference: Bool { get set }
  var summaryPreference: Bool { get set }
  var footerPreference: Bool { get set }
  var summaryBackgroundColorPreference: ColorSelection { get set }
  func resetPreferences()
}

enum PreferenceSetting: String, CaseIterable {
  case header            = "Display header",
  summary                = "Display summary",
  footer                 = "Display footer",
  summaryBackgroundColor = "Background color for summary"
}

enum ColorSelection: Comparable {
  case blue, red, green, yellow

    var title: String {
      switch self {
      case .blue:
        return "Blue"
      case .red:
        return "Red"
      case .green:
        return "Green"
      case .yellow:
        return "Yellow"
      }
    }
    
    var color: Color {
        switch self {
        case .blue:
            return Color.blue
        case .red:
            return Color.red
        case .green:
            return Color.green
        case .yellow:
            return Color.yellow
        }
    }
    
    static func from(string: String) -> ColorSelection? {
      switch string {
      case blue.title:
        return blue
      case red.title:
        return red
      case green.title:
        return green
      case yellow.title:
        return yellow
      default:
        return nil
      }
    }
}

final class PreferenceStore: PreferenceStoreProtocol {
    @Published var headerPreference = value(for: .header, defaultValue: false) {
    didSet {
        set(value: headerPreference, for: .header)
    }
  }

    @Published var summaryPreference = value(for: .summary, defaultValue: false) {
    didSet {
        set(value: summaryPreference, for: .summary)
    }
  }

    @Published var footerPreference = value(for: .footer, defaultValue: false) {
    didSet {
        set(value: footerPreference, for: .footer)
    }
  }

    @Published var summaryBackgroundColorPreference = value(for: .summaryBackgroundColor, defaultValue: .blue) {
    didSet {
        set(value: summaryBackgroundColorPreference, for: .summaryBackgroundColor)
    }
  }

  func resetPreferences() {
    let defaults = UserDefaults.standard
      PreferenceSetting.allCases.forEach { setting in
      defaults.removeObject(forKey: setting.rawValue)
    }
  }

  private static func value(for key: PreferenceSetting, defaultValue: Bool) -> Bool {
    let value = UserDefaults.standard.string(forKey: key.rawValue) ?? ""
    return value.boolValue
  }

  private static func value(for key: PreferenceSetting, defaultValue: ColorSelection) -> ColorSelection {
    let value = UserDefaults.standard.string(forKey: key.rawValue) ?? ""
    return ColorSelection.from(string: value) ?? defaultValue
  }

  private func set(value: Bool, for key: PreferenceSetting) {
    UserDefaults.standard.setValue(value, forKey: key.rawValue)
  }
    
  private func set(value: ColorSelection, for key: PreferenceSetting) {
      UserDefaults.standard.setValue(value.title, forKey: key.rawValue)
  }
}
