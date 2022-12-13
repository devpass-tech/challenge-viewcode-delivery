//
//  CategoryCellView.swift
//  DeliveryApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import UIKit

class CategoryCellView: UITableViewCell {
    
    private let stackview:UIStackView = {
        let view = UIStackView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 12
        return view
    }()
    
    private let image:UIImageView = {
        let view = UIImageView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        return view
    }()
    
    private let label:UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 11)
        label.isOpaque = true
        return label
    }()

    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?,imageName:String,text:String) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews(imageName: imageName, text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(imageName:String,text:String){
        self.image.image = UIImage(named: imageName)
        self.label.text = text
     
        configureSubviews()
        
        configureSubviewsConstraints()
        
    }
    
    func configureSubviews() {
        self.contentView.addSubview(stackview)
        
        self.stackview.addArrangedSubview(image)
        self.stackview.addArrangedSubview(label)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            image.widthAnchor.constraint(equalToConstant: 50),
            image.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}


#if DEBUG
import SwiftUI

struct CategoryCellView_Preview: PreviewProvider {
    static var previews: some View {
        let emptyView = CategoryCellView.stub()
        
        return emptyView.showPreview()
    }
}

extension CategoryCellView {
    
    static func stub() -> CategoryCellView {
        let imageName = "pizza.jpeg"
        let text = "Mercado"
        return CategoryCellView(style: .default, reuseIdentifier: "CategoryCellView",imageName: imageName, text: text)
    }
}
#endif
