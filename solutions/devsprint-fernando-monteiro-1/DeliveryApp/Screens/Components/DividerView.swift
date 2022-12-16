//
//  DividerView.swift
//  DeliveryApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import UIKit

class DividerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension DividerView {
    func setupViews() {
        self.backgroundColor = UIColor.lightGray
        
        configureSubviewsConstraints()
    }
    
    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}

#if DEBUG
import SwiftUI

struct DividerView_Preview: PreviewProvider {
    static var previews: some View {
        let dividerView = DividerView()
        
        return dividerView.showPreview()
    }
}

#endif
