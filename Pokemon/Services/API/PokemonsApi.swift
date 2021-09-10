//
//  API.swift
//  ECommerce
//
//  Created by Felipe Glautier  on 01/06/21.
//

import UIKit
import Alamofire
import AlamofireImage

class PokemonsAPI {
    
    static let shared = PokemonsAPI()
    
    func getPokemons(completion: @escaping ([PokemonsMap]?) -> Void) {
        
        let endpoint: String = "https://private-41fdd8-pokemon4.apiary-mock.com/pokemon"
        
        AF.request(endpoint, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                
                switch response.result {
                
                case .success:
                    
                    var pokemons: [PokemonsMap]?
                    if let data = response.data {
                        pokemons = try? JSONDecoder().decode([PokemonsMap].self, from: data)
                    }
                    
                    completion(pokemons)
                case .failure:
                    completion(nil)
                }
            }
    }
}
