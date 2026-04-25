//
//  ViewController.swift
//  Dicee
//
//  Created by Nikita on 20.03.2026.
//

import UIKit

class ViewController: UIViewController {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GreenBackground")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var globalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 40
        return stackView
    }()
    
    
    // Title Part
    private var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var titleImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "DiceeLogo")
        return image
    }()
    //
    
    
    private var diceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 30
        return stackView
    }()
    
    private lazy var diceImage1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "DiceTwo")
        return image
    }()
    
    private lazy var diceImage2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "DiceTwo")
        return image
    }()
    
    // Bottom Part
    
    private var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.text = "Roll the dice!"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 48)
        
        return label
    }()
    
    private lazy var rollButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.tintColor = .gray
        button.setTitle("  Roll  ", for: .normal)
        
        return button
    }()
    
    //
    
    private var result: Int = 0
    private var diceArray: [Dicee] = Dicee.getDiceArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        rollButton.addTarget(self, action: #selector(rollButtonTapped), for: .touchUpInside)
        
    }
    
    @objc private func rollButtonTapped() {
        
        guard let dice1 = diceArray.randomElement() else {return}
        guard let dice2 = diceArray.randomElement() else {return}
        
        diceImage1.image = UIImage(named: dice1.imageName)
        diceImage2.image = UIImage(named: dice2.imageName)
        
        result = dice1.number + dice2.number
        counterLabel.text = "\(result)"
    }
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(globalStackView)

        globalStackView.addArrangedSubview(titleImage)
        globalStackView.addArrangedSubview(diceStackView)
        globalStackView.addArrangedSubview(counterLabel)
        globalStackView.addArrangedSubview(rollButton)

        diceStackView.addArrangedSubview(diceImage1)
        diceStackView.addArrangedSubview(diceImage2)
    }
    
    private func setupConstraints() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        globalStackView.translatesAutoresizingMaskIntoConstraints = false
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        diceStackView.translatesAutoresizingMaskIntoConstraints = false
        diceImage1.translatesAutoresizingMaskIntoConstraints = false
        diceImage2.translatesAutoresizingMaskIntoConstraints = false
        rollButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            globalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            globalStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            globalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            titleImage.widthAnchor.constraint(equalToConstant: 200),
            titleImage.heightAnchor.constraint(equalToConstant: 100),

            diceImage1.widthAnchor.constraint(equalToConstant: 120),
            diceImage1.heightAnchor.constraint(equalToConstant: 120),

            diceImage2.widthAnchor.constraint(equalToConstant: 120),
            diceImage2.heightAnchor.constraint(equalToConstant: 120),

            rollButton.widthAnchor.constraint(equalToConstant: 100),
            rollButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

