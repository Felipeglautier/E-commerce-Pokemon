//
//  PurchaseScreenView.swift
//  ECommerce
//
//  Created by Felipe Glautier  on 17/06/21.
//

import UIKit

protocol PurchaseScreenViewDelegate: AnyObject {
    func toSave()
    func back()
}

class PurchaseScreenView: UIView {
    
    weak var delegate: PurchaseScreenViewDelegate?
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = UIColor(hex: "#0082c1")
        scrollView.contentSize = CGSize(width: self.frame.width, height: 2000)
        
        return scrollView
    }()
    
    lazy var userName: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = UIColor(hex: "#ffffff")
        label.text = "Nome do usuário:"
        
        return label
    }()
    
    lazy var textFieldUserName: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(hex: "#fafad2")
        textField.layer.cornerRadius = 8
        textField.textAlignment = .left
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.placeholder = "Digite seu nome aqui"
        textField.addTarget(self, action: #selector(checkUserName(textField:)), for: .editingChanged)
        
        return textField
    }()
    
    lazy var wrongUserName: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .red
        label.text = ""
        
        return label
    }()
    
    @objc func checkUserName(textField: UITextField) {
        if (textFieldUserName.text?.count ?? 0 <= 10) {
            wrongUserName.text = "Coloque um nome válido"
        } else {
            wrongUserName.text = " "
        }
    }
    
    lazy var birthDate: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = UIColor(hex: "#ffffff")
        label.text = "Data de nascimento:"
        
        return label
    }()
    
    lazy var textFieldBirthDate: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(hex: "#fafad2")
        textField.layer.cornerRadius = 8
        textField.textAlignment = .left
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.placeholder = "(00/00/0000)"
        textField.addTarget(self, action: #selector(checkBirthDate(textField:)), for: .editingChanged)
        
        return textField
    }()
    
    lazy var wrongBirthDate: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .red
        label.text = ""
        
        return label
    }()
    
    @objc func checkBirthDate(textField: UITextField) {
        if (textFieldBirthDate.text?.count ?? 0 <= 7) {
            wrongBirthDate.text = "Coloque uma data de nascimento válida"
        } else {
            wrongBirthDate.text = " "
        }
    }
    
    lazy var cardNumber: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = UIColor(hex: "#ffffff")
        label.text = "Número do cartão:"
        
        return label
    }()
    
    lazy var textFieldCardNumber: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(hex: "#fafad2")
        textField.layer.cornerRadius = 8
        textField.textAlignment = .left
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.placeholder = "(0000 0000 0000 0000 )"
        textField.addTarget(self, action: #selector(checkCardNumber(textField:)), for: .editingChanged)
        
        
        return textField
    }()
    
    lazy var wrongCardNumber: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .red
        label.text = ""
        
        return label
    }()
    
    @objc func checkCardNumber(textField: UITextField) {
        if (textFieldCardNumber.text?.count ?? 0 <= 15) {
            wrongCardNumber.text = "Coloque um cartão válido"
        } else {
            wrongCardNumber.text = " "
        }
    }
    
    lazy var yearOfTheCard: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = UIColor(hex: "#ffffff")
        label.text = "Ano do cartão:"
        
        return label
    }()
    
    lazy var textFieldYearOfTheCard: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(hex: "#fafad2")
        textField.layer.cornerRadius = 8
        textField.textAlignment = .center
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.placeholder = "(0000)"
        textField.addTarget(self, action: #selector(checkYearOfTheCard(textField:)), for: .editingChanged)
        
        return textField
    }()
    
    lazy var wrongYearOfTheCard: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .red
        label.text = ""
        
        return label
    }()
    
    @objc func checkYearOfTheCard(textField: UITextField) {
        if (textFieldYearOfTheCard.text?.count ?? 0 <= 3) {
            wrongYearOfTheCard.text = "coloque um ano válido"
        } else {
            wrongYearOfTheCard.text = " "
        }
    }
    
    lazy var cardMonth: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = UIColor(hex: "#ffffff")
        label.text = "Mês do cartão:"
        
        return label
    }()
    
    lazy var textFieldCardMonth: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(hex: "#fafad2")
        textField.layer.cornerRadius = 8
        textField.textAlignment = .center
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.placeholder = "(00)"
        textField.addTarget(self, action: #selector(checkdCardMonth(textField:)), for: .editingChanged)
        
        return textField
    }()
    
    lazy var wrongdCardMonth: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .red
        label.text = ""
        
        return label
    }()
    
    @objc func checkdCardMonth(textField: UITextField) {
        if (textFieldCardMonth.text?.count ?? 0 <= 1) {
            wrongdCardMonth.text = "coloque um mês válido"
        } else {
            wrongdCardMonth.text = " "
        }
    }
    
    lazy var pokemonName: UILabel = {
        let label = UILabel()
        label.numberOfLines = .max
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = UIColor(hex: "#ffffff")
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
        label.textColor = UIColor(hex: "#ffffff")
        label.text = ""
        
        return label
    }()
    
    lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Finalizar compra", for: .normal)
        button.setTitleColor(UIColor(hex: "ffffff") , for: .normal)
        button.backgroundColor = UIColor(hex: "#01be60")
        button.layer.shadowColor = UIColor(red: 0.38, green: 0.471, blue: 0.573, alpha: 0.07).cgColor
        button.layer.shadowOpacity = 10
        button.layer.shadowRadius = 9
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(savePokemon), for: .touchUpInside)
        
        return button
    }()
    
    lazy var cancelPurchase: UIButton = {
        let button = UIButton()
        button.setTitle("Cancelar a compra", for: .normal)
        button.setTitleColor(UIColor(hex: "ffffff") , for: .normal)
        button.backgroundColor = UIColor(hex: "#f51330")
        button.layer.shadowColor = UIColor(red: 0.38, green: 0.471, blue: 0.573, alpha: 0.07).cgColor
        button.layer.shadowOpacity = 10
        button.layer.shadowRadius = 9
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(back), for: .touchUpInside)
        
        return button
    }()
    
    @objc func savePokemon(sender: UIButton!) {
        self.delegate?.toSave()
    }
    
    @objc func back(sender: UIButton!) {
        self.delegate?.back()
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
    
    func setupImage(pokemonsERS: Pokemons, price: Int) {
        
        let url = URL(string: pokemonsERS.image)
        self.pokemonImage.downloadedImage(from: url!)
        
        let name = pokemonsERS.name.description
        self.pokemonName.text = "Nome: \(name)."
        
        let price = Double(price).formatedAsCurreny()
        self.pokemonPrice.text = "Preço: \(price)."
    }
    
    func createSubviews() {
        
        addSubview(scrollView)
        scrollView.addSubview(wrongUserName)
        scrollView.addSubview(wrongBirthDate)
        scrollView.addSubview(wrongCardNumber)
        scrollView.addSubview(wrongYearOfTheCard)
        scrollView.addSubview(wrongdCardMonth)
        scrollView.addSubview(userName)
        scrollView.addSubview(birthDate)
        scrollView.addSubview(cardNumber)
        scrollView.addSubview(yearOfTheCard)
        scrollView.addSubview(cardMonth)
        scrollView.addSubview(textFieldUserName)
        scrollView.addSubview(textFieldBirthDate)
        scrollView.addSubview(textFieldCardNumber)
        scrollView.addSubview(textFieldYearOfTheCard)
        scrollView.addSubview(textFieldCardMonth)
        scrollView.addSubview(buyButton)
        scrollView.addSubview(cancelPurchase)
        scrollView.addSubview(pokemonImage)
        scrollView.addSubview(pokemonName)
        scrollView.addSubview(pokemonPrice)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            pokemonImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 80),
            pokemonImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            pokemonImage.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            pokemonImage.heightAnchor.constraint(equalToConstant: 200),
            pokemonImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            pokemonName.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 10),
            pokemonName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            pokemonName.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            pokemonName.heightAnchor.constraint(equalToConstant: 50),
            pokemonName.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            pokemonPrice.topAnchor.constraint(equalTo: pokemonName.bottomAnchor, constant: 5),
            pokemonPrice.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            pokemonPrice.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            pokemonPrice.heightAnchor.constraint(equalToConstant: 50),
            pokemonPrice.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            userName.topAnchor.constraint(equalTo: pokemonPrice.bottomAnchor, constant: 50),
            userName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            userName.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            userName.heightAnchor.constraint(equalToConstant: 50),
            
            birthDate.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 80),
            birthDate.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            birthDate.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            birthDate.heightAnchor.constraint(equalToConstant: 50),
            
            cardNumber.topAnchor.constraint(equalTo: birthDate.bottomAnchor, constant: 80),
            cardNumber.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            cardNumber.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            cardNumber.heightAnchor.constraint(equalToConstant: 50),
            
            yearOfTheCard.topAnchor.constraint(equalTo:cardNumber.bottomAnchor, constant: 80),
            yearOfTheCard.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            yearOfTheCard.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            yearOfTheCard.heightAnchor.constraint(equalToConstant: 50),
            
            cardMonth.topAnchor.constraint(equalTo: cardNumber.bottomAnchor, constant: 80),
            cardMonth.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            cardMonth.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            cardMonth.heightAnchor.constraint(equalToConstant: 50),
            
            textFieldUserName.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 10),
            textFieldUserName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            textFieldUserName.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            textFieldUserName.heightAnchor.constraint(equalToConstant: 50),
            
            wrongUserName.topAnchor.constraint(equalTo: textFieldUserName.bottomAnchor, constant: -5),
            wrongUserName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            wrongUserName.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            wrongUserName.heightAnchor.constraint(equalToConstant: 50),
            
            textFieldBirthDate.topAnchor.constraint(equalTo: birthDate.bottomAnchor, constant: 10),
            textFieldBirthDate.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            textFieldBirthDate.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            textFieldBirthDate.heightAnchor.constraint(equalToConstant: 50),
            
            wrongBirthDate.topAnchor.constraint(equalTo: textFieldBirthDate.bottomAnchor, constant: -5),
            wrongBirthDate.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            wrongBirthDate.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            wrongBirthDate.heightAnchor.constraint(equalToConstant: 50),
            
            textFieldCardNumber.topAnchor.constraint(equalTo: cardNumber.bottomAnchor, constant: 10),
            textFieldCardNumber.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            textFieldCardNumber.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            textFieldCardNumber.heightAnchor.constraint(equalToConstant: 50),
            
            wrongCardNumber.topAnchor.constraint(equalTo: textFieldCardNumber.bottomAnchor, constant: -5),
            wrongCardNumber.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            wrongCardNumber.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            wrongCardNumber.heightAnchor.constraint(equalToConstant: 50),
            
            textFieldYearOfTheCard.topAnchor.constraint(equalTo: yearOfTheCard.bottomAnchor, constant: 10),
            textFieldYearOfTheCard.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            textFieldYearOfTheCard.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -240),
            textFieldYearOfTheCard.heightAnchor.constraint(equalToConstant: 50),
            
            wrongYearOfTheCard.topAnchor.constraint(equalTo: textFieldYearOfTheCard.bottomAnchor, constant: -5),
            wrongYearOfTheCard.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            wrongYearOfTheCard.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            wrongYearOfTheCard.heightAnchor.constraint(equalToConstant: 50),
            
            textFieldCardMonth.topAnchor.constraint(equalTo: cardMonth.bottomAnchor, constant: 10),
            textFieldCardMonth.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 240),
            textFieldCardMonth.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            textFieldCardMonth.heightAnchor.constraint(equalToConstant: 50),
            
            wrongdCardMonth.topAnchor.constraint(equalTo: textFieldCardMonth.bottomAnchor, constant: -5),
            wrongdCardMonth.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 240),
            wrongdCardMonth.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            wrongdCardMonth.heightAnchor.constraint(equalToConstant: 50),
            
            buyButton.topAnchor.constraint(equalTo: cardMonth.bottomAnchor, constant: 100),
            buyButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            buyButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            buyButton.heightAnchor.constraint(equalToConstant: 50),
            
            cancelPurchase.topAnchor.constraint(equalTo: buyButton.bottomAnchor, constant: 100),
            cancelPurchase.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            cancelPurchase.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            cancelPurchase.heightAnchor.constraint(equalToConstant: 50),
            cancelPurchase.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40),
        ])
    }
}
