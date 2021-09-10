//
//  PokemonDetailsViewController.swift
//  ECommerce
//
//  Created by Felipe Glautier  on 15/06/21.
//

import UIKit

class PokemonDetailsViewController: UIViewController, PokemonDetailsViewDelegate {
    
    let shareView = PokemonDetailsView()
    var pokemons: Pokemons?
    var price:  Int?
    var image: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        setupNavigationBar()
    }
    
    override func loadView() {
        
        view = shareView
        shareView.delegate =  self
        
        // checando se a variável tem valor
        if let pokemons = self.pokemons,
           let price =  self.price {
            shareView.setup(pokemonsDetails: pokemons, price: price)
        }
    }
    
    private func setupNavigationBar() {
        
        navigationController?.navigationBar.tintColor = UIColor(hex: "#ffff00")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title =  "Pokémons"
        navigationController?.navigationBar.barTintColor = UIColor(hex: "#0e4bef")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(hex: "#ffff00")]
    }
    
    func goToPurchaseScreen() {
        let home = PurchaseScreenViewController()
        home.price = price
        home.pokemons = pokemons
        self.navigationController?.pushViewController(home, animated: true)
    }
}

