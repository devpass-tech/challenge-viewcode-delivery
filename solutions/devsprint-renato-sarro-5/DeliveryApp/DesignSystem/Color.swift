//
//  Color.swift
//  DeliveryApp
//
//  Created by Cora on 21/09/22.
//

import UIKit

enum DesignSystemColor {
    case primary
    case secondary
    
    var color: UIColor {
        switch self {
        case .primary:
            return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        case .secondary:
            return UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        }
    }
}
