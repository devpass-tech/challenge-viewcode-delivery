//
//  AddressSearchView.swift
//  DeliveryApp
//
//  Created by José Vitor Scheffer Boff dos Santos on 16/12/22.
//

import UIKit

final class AddressSearchView: UIView {

    private let addressCellIdentifier = "AddressCellView"

    private var addresses: [Address] = []

    lazy var tableView: AddressListView = {
        let tableView = AddressListView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    init() {

        super.init(frame: .zero)

        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateView() {

        self.tableView.reloadData()
    }
}

private extension AddressSearchView {

    func setupViews() {

        self.backgroundColor = .white

        self.configureSubviews()
        self.configureSubviewsConstraints()
    }

    func configureSubviews() {

    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
            
        ])
    }
}

#if DEBUG
import SwiftUI

struct AddressSearchView_Preview: PreviewProvider {
    static var previews: some View {
        let addressSearchView = AddressSearchView()
        
        return addressSearchView.showPreview()
    }
}
#endif
