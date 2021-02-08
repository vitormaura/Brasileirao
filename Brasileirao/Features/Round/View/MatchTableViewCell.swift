//
//  MatchTableViewCell.swift
//  Brasileirao
//
//  Created by Vitor Maura on 02/10/20.
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    //MARK: - CONSTANTS -
    let cardView: CardView = {
        CardView()
    }()
    
    //MARK: - LAYOUT SUBVIEWS -
    override func layoutSubviews() {
        super.layoutSubviews()
        self.selectionStyle = .none
        self.addSubview(cardView)
        self.setupConstraints()
    }
}

//MARK: - AUX FUNCTIONS -
extension MatchTableViewCell {
    func setupViewData(viewData: MatchViewData) {
        self.cardView.dateLabel.text = viewData.eventDate
        self.cardView.homeTeamNameLabel.text = viewData.homeTeamName
        self.cardView.homeTeamScoreLabel.text = viewData.homeTeamScore
        self.cardView.homeTeamImage.loadImage(urlString: viewData.homeTeamLogoUrl)
        self.cardView.awayTeamNameLabel.text = viewData.awayTeamName
        self.cardView.awayTeamScoreLabel.text = viewData.awayTeamScore
        self.cardView.awayTeamImage.loadImage(urlString: viewData.awayTeamLogoUrl)
        self.accessibilityIdentifier = "cell-identifier-" + viewData.homeTeamName
    }
}

//MARK: - UI FUNCTIONS -
extension MatchTableViewCell {
    private func setupConstraints() {
        self.cardView.translatesAutoresizingMaskIntoConstraints = false
        self.cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        self.cardView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        self.cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        self.cardView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
    }
}
