//
//  CardView.swift
//  Brasileirao
//
//  Created by Vitor Maura on 04/10/20.
//

import UIKit

class CardView: UIView {
    //MARK: - CONSTANTS -
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 24
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 8
        return view
    }()
    
    let versusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "X"
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    let homeTeamNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 22)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    let homeTeamScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    let homeTeamImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let awayTeamNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 22)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    let awayTeamScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    let awayTeamImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let venueNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    //MARK: - INIT -
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addAllSubviews()
        self.setupAllConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addAllSubviews()
        self.setupAllConstraints()
    }
}

//MARK: - UI FUNCTIONS -
extension CardView {
    private func addAllSubviews() {
        self.addSubview(contentView)
        self.contentView.addSubview(self.dateLabel)
        self.contentView.addSubview(self.homeTeamNameLabel)
        self.contentView.addSubview(self.homeTeamScoreLabel)
        self.contentView.addSubview(self.homeTeamImage)
        self.contentView.addSubview(self.awayTeamNameLabel)
        self.contentView.addSubview(self.awayTeamScoreLabel)
        self.contentView.addSubview(self.awayTeamImage)
        self.contentView.addSubview(self.versusLabel)
        self.contentView.addSubview(self.venueNameLabel)
    }
    
    private func setupAllConstraints() {
        self.setupContentView()
        self.setupHomeTeamNameLabel()
        self.setupHomeTeamScoreLabel()
        self.setupHomeTeamImage()
        self.setupAwayTeamNameLabel()
        self.setupAwayTeamScoreLabel()
        self.setupAwayTeamImage()
        self.setupDateLabel()
        self.setupVersusLabel()
        self.setupVenueNameLabel()
    }
    
    private func setupContentView() {
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    private func setupDateLabel() {
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.dateLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        self.dateLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
        self.dateLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10).isActive = true
    }
    
    private func setupHomeTeamNameLabel() {
        self.homeTeamNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.homeTeamNameLabel.centerYAnchor.constraint(equalTo: self.homeTeamImage.centerYAnchor).isActive = true
        self.homeTeamNameLabel.centerXAnchor.constraint(equalTo: self.homeTeamImage.centerXAnchor, constant: -50).isActive = true
    }
    
    private func setupHomeTeamScoreLabel() {
        self.homeTeamScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        self.homeTeamScoreLabel.centerYAnchor.constraint(equalTo: self.versusLabel.centerYAnchor).isActive = true
        self.homeTeamScoreLabel.centerXAnchor.constraint(equalTo: self.versusLabel.centerXAnchor, constant: -25).isActive = true
    }
    
    private func setupHomeTeamImage() {
        self.homeTeamImage.translatesAutoresizingMaskIntoConstraints = false
        self.homeTeamImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.homeTeamImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.homeTeamImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 5).isActive = true
        self.homeTeamImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor, constant: -70).isActive = true
    }
    
    private func setupVersusLabel() {
        self.versusLabel.translatesAutoresizingMaskIntoConstraints = false
        self.versusLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.versusLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 2.5).isActive = true
    }
    
    private func setupAwayTeamNameLabel() {
        self.awayTeamNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.awayTeamNameLabel.centerYAnchor.constraint(equalTo: self.awayTeamImage.centerYAnchor).isActive = true
        self.awayTeamNameLabel.centerXAnchor.constraint(equalTo: self.awayTeamImage.centerXAnchor, constant: 50).isActive = true
    }
    
    private func setupAwayTeamScoreLabel() {
        self.awayTeamScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        self.awayTeamScoreLabel.centerYAnchor.constraint(equalTo: self.versusLabel.centerYAnchor).isActive = true
        self.awayTeamScoreLabel.centerXAnchor.constraint(equalTo: self.versusLabel.centerXAnchor, constant: 25).isActive = true
    }
    
    private func setupAwayTeamImage() {
        self.awayTeamImage.translatesAutoresizingMaskIntoConstraints = false
        self.awayTeamImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.awayTeamImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.awayTeamImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 5).isActive = true
        self.awayTeamImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor, constant: 70).isActive = true
    }
    
    private func setupVenueNameLabel() {
        self.venueNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.venueNameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        self.venueNameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
        self.venueNameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10).isActive = true
    }
}
