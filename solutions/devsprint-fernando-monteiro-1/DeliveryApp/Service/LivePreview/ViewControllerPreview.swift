//
//  ViewControllerPreview.swift
//  DeliveryApp
//
//  Created by Julia Frederico on 06/12/22.
//

import UIKit

#if DEBUG
import SwiftUI

struct ViewControllerPreview: UIViewControllerRepresentable {
    
    let viewControllerBuilder: () -> UIViewController

    init(_ viewControllerBuilder: @escaping () -> UIViewController) {
        self.viewControllerBuilder = viewControllerBuilder
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return viewControllerBuilder()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }

}
#endif
