//
//  UIView+Extensions.swift
//  DeliveryApp
//
//  Created by Rafael de Paula on 14/04/22.
//

import SwiftUI
import UIKit

extension UIView {
    
    @available(iOS 13, *)
    private struct Preview: UIViewRepresentable {
        typealias UIViewType = UIView
        let view: UIView
        
        func makeUIView(context: Context) -> UIView {
            return view
        }
        
        func updateUIView(_ uiView: UIView, context: Context) { }
    }
    
    @available(iOS 13, *)
    func showPreview() -> some View {
        Preview(view: self)
    }
}
