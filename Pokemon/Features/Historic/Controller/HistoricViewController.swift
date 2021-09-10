//
//  HistoricViewController.swift
//  PokemonShop
//
//  Created by Felipe Glautier  on 29/06/21.
//

import UIKit
import RealmSwift

class HistoricViewController: UIViewController {
    
    fileprivate var dataBase: Realm?
    fileprivate var PokemonDatabase: RealmSwift.Results<PokemonDatabaseMap>?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(HistoricViewCell.self, forCellReuseIdentifier: "HistoricViewCell")
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
        
        dataBase = try! Realm()
        updateData()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        setupNavigationBar()
        setupConstraints()
    }
    
    func updateData() {
        guard let dataBase = self.dataBase else { return }
        PokemonDatabase = dataBase.objects(PokemonDatabaseMap.self)
    }
    
    private func setupNavigationBar() {
        
        navigationController?.navigationBar.tintColor = UIColor(hex: "#ffff00")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title =  "Historico de compras"
        navigationController?.navigationBar.barTintColor = UIColor(hex: "#0e4bef")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(hex: "#ffff00")]
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 30),
        ])
    }
}

extension HistoricViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let pokemonsHis = self.PokemonDatabase else {
            return 0
        }
        return pokemonsHis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let pokemonsHis = self.PokemonDatabase else {
            
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoricViewCell", for: indexPath) as! HistoricViewCell
        
        cell.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1);
        cell.setImage(name: pokemonsHis[indexPath.row].name, image: pokemonsHis[indexPath.row].image)
        cell.selectionStyle = .none
        return cell
    }
    // Aumentando a célula da tableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Apagando a compra do histórico
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if self.PokemonDatabase?.count == 0 {
            return
        }          else {
            guard let purchases = self.PokemonDatabase, let dataBase = self.dataBase else { return }
            if (editingStyle == UITableViewCell.EditingStyle.delete) {
                try! dataBase.write {dataBase.delete(purchases[indexPath.item])}
                updateData()
                tableView.reloadData()
            }
        }
    }
}
