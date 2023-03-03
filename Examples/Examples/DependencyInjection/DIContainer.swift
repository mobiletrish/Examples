//
//  DIContainer.swift
//  Examples
//
//  Created by Patricia Fulk on 1/30/23.
//

import Foundation

protocol DIContainerProtocol {
  func add<DIComponent>(type: DIComponent.Type, dicomponent: Any)
  func get<DIComponent>(type: DIComponent.Type) -> DIComponent?
}

final class DIContainer: DIContainerProtocol {
    static let instance = DIContainer()

  private init() {}

  var components: [String: Any] = [:]

  func add<DIComponent>(type: DIComponent.Type, dicomponent: Any) {
    components["\(type)"] = dicomponent
  }

  func get<DIComponent>(type: DIComponent.Type) -> DIComponent? {
      return components["\(type)"] as? DIComponent

  }
}


