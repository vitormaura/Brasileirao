//
//  HapticAlert.swift
//  Brasileirao
//
//  Created by Vitor Maura on 04/10/20.
//

import Foundation
import UIKit

class HapticAlert {
    //MARK: - FUNCTIONS -
    class func hapticReturn(style: UIImpactFeedbackGenerator.FeedbackStyle){
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
    }
    
    class func hapticReturnStatus(type: UINotificationFeedbackGenerator.FeedbackType){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
}
