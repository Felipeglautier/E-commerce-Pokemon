//
//  Pokemons.swift
//  ECommerce
//
//  Created by Felipe Glautier  on 01/06/21.
//

import Foundation

class PokemonsMap: Codable {
    
    var id: Int
    var section: String
    var price: Int
    var pokemons: [Pokemons]
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case section
        case price
        case pokemons
    }
}
