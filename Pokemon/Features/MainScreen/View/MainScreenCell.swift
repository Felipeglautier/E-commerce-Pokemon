//
//  MainScreenCell.swift
//  ECommerce
//
//  Created by Felipe Glautier  on 04/06/21.
//

import UIKit

protocol MainScreenCellDelegate: AnyObject {
    func buttonAtcion(index: Int)
}

class MainScreenCell: UITableViewCell {
    
    weak var delegate: MainScreenCellDelegate?
    
    // 2 propriedades: 1 UIVIEW - 1 UILABEL
    
    lazy var introductionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .center
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(pokemonsMap:PokemonsMap) {
        
        self.introductionLabel.text = pokemonsMap.section
    }
    
    func createSubviews() {
        
        addSubview(backgroundTouchView)
        backgroundTouchView.addSubview(introductionLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundTouchView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            backgroundTouchView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            backgroundTouchView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            backgroundTouchView.heightAnchor.constraint(equalToConstant: 47),
            backgroundTouchView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            introductionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            introductionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            introductionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            introductionLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
