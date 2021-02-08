//
//  EventTableViewCell.swift
//  Brasileirao
//
//  Created by Vitor Maura on 04/10/20.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    //MARK: - CONSTANTS -
    let eventView: EventView = {
        let view = EventView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    //MARK: - LAYOUT SUBVIEWS -
    override func layoutSubviews() {
        super.layoutSubviews()
        self.selectionStyle = .none
        self.addSubview(self.eventView)
        self.setupEventViewConstraints()
    }
}

//MARK: - AUX FUNCTIONS -
extension EventTableViewCell {
    func setupViewData(viewData: EventsMatchViewData) {
        self.eventView.timeLabel.text = viewData.elapsedTime
        self.eventView.eventImage.image = UIImage(named: viewData.detailImageName)
        self.eventView.teamImage.loadImage(urlString: viewData.teamLogoUrl)
        self.eventView.titleLabel.text = viewData.eventTitle
        self.eventView.subtitleLabel.text = viewData.eventDetail
        self.accessibilityIdentifier = "cell-event-identifier-" + viewData.elapsedTime
    }
}

//MARK: - UI FUNCTIONS -
extension EventTableViewCell {
    private func setupEventViewConstraints() {
        self.eventView.translatesAutoresizingMaskIntoConstraints = false
        self.eventView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.eventView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.eventView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.eventView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        let heighConstraint = self.eventView.heightAnchor.constraint(greaterThanOrEqualToConstant: 95)
        heighConstraint.priority = .init(rawValue: 999)
        heighConstraint.isActive = true
    }
}
    
