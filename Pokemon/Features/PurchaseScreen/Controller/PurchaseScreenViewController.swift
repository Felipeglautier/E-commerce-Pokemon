//
//  PurchaseScreenViewController.swift
//  ECommerce
//
//  Created by Felipe Glautier  on 17/06/21.
//

import UIKit
import RealmSwift
import Foundation

class PurchaseScreenViewController: UIViewController, PurchaseScreenViewDelegate {
    
    let shareView = PurchaseScreenView()
    var pokemons: Pokemons?
    var price: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    override func loadView() {
        
        view = shareView
        shareView.delegate = self
        
        if let pokemons = self.pokemons,
           let price = self.price  {
            shareView.setupImage(pokemonsERS: pokemons, price: price)
        }
    }
    
    private func setupNavigationBar() {
        
        navigationController?.navigationBar.tintColor = UIColor(hex: "#ffff00")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title =  "Cadastre seus dados"
        navigationController?.navigationBar.barTintColor = UIColor(hex: "#0e4bef")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(hex: "#ffff00")]
    }
    
    func toSave() {
        
        let alert = UIAlertController(title: "Compra", message: "Parabéns sua compra foi realizada com sucesso!", preferredStyle: UIAlertController.Style.alert)
        
        // adicionando a ação (botão)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        
        // monstrando o alerta
        self.present(alert, animated: true, completion: nil)
        let realm = try! Realm()
        guard let pokemons = pokemons else {
            return
        }
        
        try! realm.write {
            let database = PokemonDatabaseMap()
            
            database.name = pokemons.name
            database.image =  pokemons.image
            realm.add(database)
        }
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func back() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
