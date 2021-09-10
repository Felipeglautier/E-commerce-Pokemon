//
//  44.swift
//  ECommerce
//
//  Created by Felipe Glautier  on 01/06/21.
//

import Foundation

class Pokemons: Codable {
    
    var name: String
    var types: [String]
    var weakness: [String]
    var description: String
    var image:  String
    
    enum CodingKeys: String, CodingKey {
        
        case name
        case types
        case weakness
        case description
        case image
    }
}
