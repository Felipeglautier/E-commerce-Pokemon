//
//  HistoricTabBar.swift
//  PokemonShop
//
//  Created by Felipe Glautier  on 28/06/21.
//

import UIKit

class HistoricViewCell: UITableViewCell {
    
    lazy var pokemonName: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = UIColor(hex: "#ffff00")
        label.text = ""
        
        return label
    }()
    
    lazy var backgroundTouchView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "#0e4bef")
        view.layer.shadowColor = UIColor(red: 0.38, green: 0.471, blue: 0.573, alpha: 0.07).cgColor
        view.layer.shadowOpacity = 10
        view.layer.shadowRadius = 9
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setImage(name: String, image: String) {
        
        let url = URL(string: image)
        self.pokemonName.text = name
        self.pokemonImage.downloadedImage(from: url!)
    }
    
    func createSubviews() {
        addSubview(backgroundTouchView)
        addSubview(pokemonName)
        addSubview(pokemonImage)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundTouchView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            backgroundTouchView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            backgroundTouchView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            backgroundTouchView.heightAnchor.constraint(equalToConstant: 50),
            backgroundTouchView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            pokemonName.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            pokemonName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            pokemonName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            pokemonName.heightAnchor.constraint(equalToConstant: 47),
            
            pokemonImage.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            pokemonImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            pokemonImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            pokemonImage.heightAnchor.constraint(equalToConstant: 47),
        ])
    }
}
