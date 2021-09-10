//
//  PokemonDetailsView.swift
//  ECommerce
//
//  Created by Felipe Glautier  on 15/06/21.
//

import UIKit

protocol PokemonDetailsViewDelegate: AnyObject {
    func goToPurchaseScreen()
}

class PokemonDetailsView: UIView {
    
    weak var delegate: PokemonDetailsViewDelegate?
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = UIColor(hex: "#fafad2")
        scrollView.contentSize = CGSize(width: self.frame.width, height: 2000)
        
        return scrollView
    }()
    
    lazy var pokemonName: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = UIColor(hex: "#120a8f")
        label.text = ""
        
        return label
    }()
    
    lazy var pokemonTypes: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = UIColor(hex: "#120a8f")
        label.text = ""
        
        return label
    }()
    
    lazy var pokemonWeakness: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = UIColor(hex: "#120a8f")
        label.text = ""
        
        return label
    }()
    
    lazy var pokemonDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = UIColor(hex: "#120a8f")
        label.text = ""
        
        return label
    }()
    
    lazy var pokemonPrice: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = UIColor(hex: "#120a8f")
        label.text = ""
        
        return label
    }()
    
    lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var mainImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "pokemon"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("comprar", for: .normal)
        button.setTitleColor(UIColor(hex: "120a8f") , for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(hex: "#ffff71")
        button.layer.shadowColor = UIColor(red: 0.38, green: 0.471, blue: 0.573, alpha: 0.07).cgColor
        button.layer.shadowOpacity = 10
        button.layer.shadowRadius = 9
        button.layer.cornerRadius = 20
        button.addTarget(nil, action: #selector(close), for: .touchUpInside)
        
        return button
    }()
    
    @objc func close(sender: UIButton!) {
        self.delegate?.goToPurchaseScreen()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
        setupConstraints()
    }
    
    func setup(pokemonsDetails: Pokemons, price: Int) {
        
        let url = URL(string: pokemonsDetails.image)
        
        let name = pokemonsDetails.name.description
        self.pokemonName.text = "Nome: \(name)."
        
        self.pokemonImage.downloadedImage(from: url!)
        
        let description = pokemonsDetails.description
        self.pokemonDescription.text = "Descrição: \(description)"
        
        let price = Double(price).formatedAsCurreny()
        self.pokemonPrice.text = "Preço: \(price)."
        
        var types = pokemonsDetails.types.description.replacingOccurrences(of: "[", with: "")
        types = types.replacingOccurrences(of: "]", with: "")
        types = types.replacingOccurrences(of: ",", with: "")
        self.pokemonTypes.text = "Tipos: \(types)."
        
        var weakness = pokemonsDetails.weakness.description.replacingOccurrences(of: "[", with: "")
        weakness = weakness.replacingOccurrences(of: "]", with: "")
        weakness = weakness.replacingOccurrences(of: ",", with: "")
        self.pokemonWeakness.text = "Fraquezas: \(weakness)."
        
    }
    
    func createSubviews() {
        
        addSubview(scrollView)
        scrollView.addSubview(mainImage)
        scrollView.addSubview(pokemonName)
        scrollView.addSubview(pokemonPrice)
        scrollView.addSubview(pokemonTypes)
        scrollView.addSubview(pokemonWeakness)
        scrollView.addSubview(pokemonDescription)
        scrollView.addSubview(pokemonImage)
        scrollView.addSubview(buyButton)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            mainImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            mainImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            mainImage.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            mainImage.heightAnchor.constraint(equalToConstant: 100),
            mainImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            pokemonName.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 60),
            pokemonName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            pokemonName.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            pokemonName.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            pokemonPrice.topAnchor.constraint(equalTo: pokemonName.bottomAnchor, constant: 60),
            pokemonPrice.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            pokemonPrice.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            pokemonPrice.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            pokemonTypes.topAnchor.constraint(equalTo: pokemonPrice.bottomAnchor, constant: 60),
            pokemonTypes.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            pokemonTypes.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            pokemonTypes.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            pokemonWeakness.topAnchor.constraint(equalTo: pokemonTypes.bottomAnchor, constant: 60),
            pokemonWeakness.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            pokemonWeakness.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            pokemonWeakness.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            pokemonDescription.topAnchor.constraint(equalTo: pokemonWeakness.bottomAnchor, constant: 60),
            pokemonDescription.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            pokemonDescription.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            pokemonDescription.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            pokemonImage.topAnchor.constraint(equalTo: pokemonDescription.bottomAnchor, constant: 60),
            pokemonImage.heightAnchor.constraint(equalToConstant: 300),
            pokemonImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            buyButton.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 60),
            buyButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            buyButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            buyButton.heightAnchor.constraint(equalToConstant: 50),
            buyButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40)
        ])
    }
}
