//
//  ExtensionUIImageView.swift
//  Brasileirao
//
//  Created by Vitor Maura on 02/10/20.
//

import UIKit

extension UIImageView {
    // MARK: - VARIABLES -
    private var imageCache: NSCache<NSString, UIImage> {
        NSCache<NSString, UIImage>()
    }
    
    // MARK: - FUNCTIONS -
    func loadImage(urlString: String) {
        guard let image = self.getImageFromCache(urlString: urlString)
              else { self.getImageFromNetwork(urlString: urlString) ; return }
        self.image = image
    }
    
    private func getImageFromNetwork(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        self.image = nil
        let activityIndicator = self.createIndicator()
        URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            if error != nil {
                DispatchQueue.main.async {
                    activityIndicator.removeFromSuperview()
                    self.image = UIImage(named: "image_default")
                }
            }
            DispatchQueue.main.async {
                if let imageData = data,
                   let image = UIImage(data: imageData) {
                    self.imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                    activityIndicator.removeFromSuperview()
                }
            }
        }).resume()
    }
    
    private func createIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        self.addSubview(activityIndicator)
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        activityIndicator.center = self.center
        return activityIndicator
    }
    
    private func getImageFromCache(urlString: String) -> UIImage? {
        guard let cachedImage = self.imageCache.object(forKey: urlString as NSString)
              else { return nil }
        return cachedImage
    }
}
