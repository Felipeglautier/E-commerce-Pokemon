//
//  ExtensionDouble.swift
//  PokemonShop3
//
//  Created by Felipe Glautier  on 09/07/21.
//

import Foundation

extension Double {
    
    func formatedAsCurreny() -> String {
        return String(format: "R$ %.2f", locale: Locale(identifier: "pt_BR"), self)
    }
}
