//
//  ViewController+Preview.swift
//  DeliveryApp
//
//  Created by Julia Frederico on 06/12/22.
//

#if DEBUG
import UIKit
import SwiftUI

extension UIViewController {

    private struct Preview: UIViewControllerRepresentable {

        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    }
    
    func showPreview() -> some View {
        Preview(viewController: self)
    }

}
#endif
