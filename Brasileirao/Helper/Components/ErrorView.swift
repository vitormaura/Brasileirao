//
//  ErrorView.swift
//  Brasileirao
//
//  Created by Vitor Maura on 05/10/20.
//

import UIKit

class ErrorView: UIView {
    //MARK: - VARIABLES -
    var reloadAction: (() -> ())?
    
    //MARK: - CONSTANTS -
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let reloadImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "reload")
        imageView.tintColor = .systemGreen
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Ocorreu um erro\nToque para atualizar"
        label.textColor = .label
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    //MARK: - INIT -
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addAllSubviews()
        self.setupAllConstraints()
        self.addGestures()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addAllSubviews()
        self.setupAllConstraints()
        self.addGestures()
    }
}

//MARK: - UI FUNCTIONS -
extension ErrorView {
    private func addAllSubviews() {
        self.addSubview(self.contentView)
        self.contentView.addSubview(self.reloadImage)
        self.contentView.addSubview(self.errorMessageLabel)
    }
    
    private func setupAllConstraints() {
        self.setupContentViewConstraints()
        self.setupReloadImageConstraints()
        self.setupErrorMessageLabelConstraints()
    }
    
    private func setupContentViewConstraints() {
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    private func setupReloadImageConstraints() {
        self.reloadImage.translatesAutoresizingMaskIntoConstraints = false
        self.reloadImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.reloadImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.reloadImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.reloadImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }
    
    private func setupErrorMessageLabelConstraints() {
        self.errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.errorMessageLabel.topAnchor.constraint(equalTo: self.reloadImage.topAnchor, constant: 60).isActive = true
        self.errorMessageLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        self.errorMessageLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
    }
}

//MARK: - AUX FUNCTIONS -
extension ErrorView {
    private func addGestures() {
        let reloadTap = UITapGestureRecognizer(target: self, action: #selector(self.reload))
        self.contentView.addGestureRecognizer(reloadTap)
    }
    
    @objc private func reload() {
        UIView.animate(withDuration:0.2, animations: {
            self.reloadImage.transform =
                CGAffineTransform(rotationAngle: CGFloat(CGFloat(Double.pi)))
        })
        UIView.animate(withDuration: 0.2, delay: 0.15, options: .curveEaseIn, animations: {
            self.reloadImage.transform =
                CGAffineTransform(rotationAngle: CGFloat(CGFloat(Double.pi * 2)))
        }) { _ in
            self.reloadAction?()
        }
    }
}
