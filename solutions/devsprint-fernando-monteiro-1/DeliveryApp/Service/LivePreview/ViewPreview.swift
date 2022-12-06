//
//  ViewPreview.swift
//  DeliveryApp
//
//  Created by Julia Frederico on 06/12/22.
//

import UIKit

#if DEBUG
import SwiftUI

struct ViewPreview: UIViewRepresentable {

    let viewBuilder: () -> UIView

    init(_ viewBuilder: @escaping () -> UIView) {
        self.viewBuilder = viewBuilder
    }

    func makeUIView(context: Context) -> some UIView {
        viewBuilder()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //
    }

}
#endif
