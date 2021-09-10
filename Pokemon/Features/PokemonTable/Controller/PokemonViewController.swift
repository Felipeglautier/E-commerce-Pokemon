//
//  MainScreenTableView.swift
//  ECommerce
//
//  Created by Felipe Glautier  on 09/06/21.
//

import UIKit

class PokemonViewController: UIViewController {
    
    var pokemons: [Pokemons]?
    var price: Int?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(PokemonView.self, forCellReuseIdentifier: "PokemonView")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsMultipleSelection = false
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.allowsSelection = true
        tableView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1);
        tableView.estimatedRowHeight = 110
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        setupNavigationBar()
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        
        navigationController?.navigationBar.tintColor = UIColor(hex: "#ffff00")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title =  "Pokémons"
        navigationController?.navigationBar.barTintColor = UIColor(hex: "#0e4bef")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(hex: "#ffff00")]
    }
    
    @objc func buttonActionn() {
        let home = HistoricViewController()
        self.navigationController?.pushViewController(home, animated:true)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 30),
        ])
    }
}

extension PokemonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let pokemons = self.pokemons else {
            return 0
        }
        
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let pokemons = self.pokemons else {
            return UITableViewCell()
            
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonView", for: indexPath) as! PokemonView
        
        cell.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1);
        cell.setup(pokemons: pokemons[indexPath.row]) 
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let pokemons = self.pokemons,
              let price = self.price else
        {
            return
        }
        
        let pokemonTable = PokemonDetailsViewController()
        pokemonTable.pokemons = pokemons[indexPath.row]
        pokemonTable.price = price
        self.navigationController?.pushViewController(pokemonTable, animated: true)
    }
}
