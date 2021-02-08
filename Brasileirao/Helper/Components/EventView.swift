//
//  EventView.swift
//  Brasileirao
//
//  Created by Vitor Maura on 05/10/20.
//

import UIKit

class EventView: UIView {
    //MARK: - CONSTANTS -
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    let eventImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let teamImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        label.numberOfLines = 0
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
extension EventView {
    private func addAllSubviews() {
        self.addSubview(self.containerView)
        self.containerView.addSubview(self.timeLabel)
        self.containerView.addSubview(self.lineView)
        self.containerView.addSubview(self.eventImage)
        self.containerView.addSubview(self.teamImage)
        self.containerView.addSubview(self.titleLabel)
        self.containerView.addSubview(self.subtitleLabel)
    }
    
    private func setupAllConstraints() {
        self.setupContentViewConstraints()
        self.setupTimeLabelConstraints()
        self.setupLineViewConstraints()
        self.setupEventImageConstraints()
        self.setupTeamImageConstraints()
        self.setupTitleLabelConstraints()
        self.setupsubtitleLabelConstraints()
    }
    
    private func setupContentViewConstraints() {
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        self.containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.containerView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.containerView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    private func setupTimeLabelConstraints() {
        self.timeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.timeLabel.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor).isActive = true
        self.timeLabel.leftAnchor.constraint(equalTo: self.containerView.leftAnchor,constant: 15).isActive = true
        self.timeLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setupLineViewConstraints() {
        self.lineView.translatesAutoresizingMaskIntoConstraints = false
        self.lineView.leftAnchor.constraint(equalTo: self.timeLabel.rightAnchor, constant: 15).isActive = true
        self.lineView.widthAnchor.constraint(equalToConstant: 2).isActive = true
        self.lineView.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        self.lineView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor).isActive = true
    }
    
    private func setupEventImageConstraints() {
        self.eventImage.translatesAutoresizingMaskIntoConstraints = false
        self.eventImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.eventImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        self.eventImage.centerXAnchor.constraint(equalTo: self.lineView.centerXAnchor).isActive = true
        self.eventImage.centerYAnchor.constraint(equalTo: self.lineView.centerYAnchor, constant: -20).isActive = true
    }
    
    private func setupTeamImageConstraints() {
        self.teamImage.translatesAutoresizingMaskIntoConstraints = false
        self.teamImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        self.teamImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        self.teamImage.leftAnchor.constraint(equalTo: self.lineView.rightAnchor,constant: 15).isActive = true
        self.teamImage.centerYAnchor.constraint(equalTo: self.lineView.centerYAnchor).isActive = true
    }
    
    private func setupTitleLabelConstraints() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 25).isActive = true
        self.titleLabel.leftAnchor.constraint(equalTo: self.teamImage.rightAnchor, constant: 15).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -15).isActive = true
        let bottomConstraint = self.titleLabel.bottomAnchor.constraint(equalTo: self.subtitleLabel.topAnchor, constant: -5)
        bottomConstraint.priority = .init(999)
        bottomConstraint.isActive = true
    }
    
    private func setupsubtitleLabelConstraints() {
        self.subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.subtitleLabel.leftAnchor.constraint(equalTo: self.teamImage.rightAnchor, constant: 15).isActive = true
        self.subtitleLabel.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -15).isActive = true
        self.subtitleLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -25).isActive = true
    }
}
