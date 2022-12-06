//
//  UIView+Preview.swift
//  DeliveryApp
//
//  Created by Julia Frederico on 06/12/22.
//

import UIKit

#if DEBUG
import SwiftUI

extension UIView {

    private struct Preview: UIViewRepresentable {

        let view: UIView
        
        func makeUIView(context: Context) -> UIView {
            return view
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
    }
    
    func showPreview() -> some View {
        Preview(view: self)
    }

}
#endif
