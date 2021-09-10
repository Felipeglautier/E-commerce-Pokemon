 
 //
 //  ViewController.swift
 //  ECommerce
 //
 //  Created by Felipe Glautier  on 01/06/21.
 //
 
 import UIKit
 import Alamofire
 
 class MainScreenViewController: UIViewController, MainScreenCellDelegate {
    
    var pokemonsMap: [PokemonsMap]?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(MainScreenCell.self, forCellReuseIdentifier: "MainScreenCell")
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
    
    override func viewWillAppear(_ animated: Bool) {
        getPokemons()
    }
    
    private func setupNavigationBar() {
        
        let historicButton = UIBarButtonItem(title: "Compras", style: UIBarButtonItem.Style.plain, target: self, action: #selector(goToHistoricScreen))
        navigationItem.rightBarButtonItem = historicButton
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title =  "Pokémons"
        navigationController?.navigationBar.barTintColor = UIColor(hex: "#0e4bef")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(hex: "#ffff00")]
    }
    
    @objc func goToHistoricScreen() {
        let home = HistoricViewController()
        self.navigationController?.pushViewController(home, animated:true)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 50),
        ])
    }
    
    func getPokemons() {
        loadingIndicator() // abrindo alerta
        PokemonsAPI.shared.getPokemons{ pokemonsMap in // fund -> retorno do request
            self.dismissAlert() // fechando alerta
            
            if pokemonsMap == nil {  // verificando se tem retorno do request
                print("Falhou")
                return
            }
            
            self.pokemonsMap = pokemonsMap // atruibuindo valor a  nossa variável
            self.tableView.reloadData() // recarregando os dados da table view
        }
    }
    
    func loadingIndicator() {
        let alert = UIAlertController(title: nil, message: "Carregando...", preferredStyle: .alert)
        present(alert, animated: false, completion: nil)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .large
        loadingIndicator.startAnimating()
    }
    
    func dismissAlert() {
        
        if let vc = self.presentedViewController, vc is UIAlertController {
            dismiss(animated: false, completion: nil)
        }
    }
    
    func buttonAtcion(index: Int) {
        let selectedProduct = pokemonsMap?[index].pokemons
        print(selectedProduct ?? [])
    }
 }
 
 extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let pokemonsMap = self.pokemonsMap else {
            return 0
        }
        
        return pokemonsMap.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let pokemonsMap = self.pokemonsMap else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainScreenCell", for: indexPath) as! MainScreenCell
        
        cell.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1);
        cell.setup(pokemonsMap: pokemonsMap[indexPath.row])
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let pokemonsMap = self.pokemonsMap else {
            return
        }
        let viewController = PokemonViewController()
        viewController.pokemons = pokemonsMap[indexPath.row].pokemons
        viewController.price = pokemonsMap[indexPath.row].price
        self.navigationController?.pushViewController(viewController, animated: true)
    }
 }
 
