//
//  AddressSearchViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class AddressSearchViewController: UIViewController {
    
    private let searchController = UISearchController()

    private let deliveryApi = DeliveryApi()

    private lazy var addressSearchView: AddressSearchView = {
        let addressSearchView = AddressSearchView()
        
        return addressSearchView
    }()

    init() {
        super.init(nibName: nil, bundle: nil)

        navigationItem.title = "Search"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = addressSearchView
    }

    override func viewDidLoad() {

        deliveryApi.searchAddresses { addresses in

            guard let addresses = addresses else {
                return
            }

            DispatchQueue.main.async {
                let tableView = self.addressSearchView.tableView

                tableView.updateView(with: addresses)
            }
        }
        
        configSearchBar()
    }
    
    private func configSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Rua, número, bairro"
    }
}

#if DEBUG
import SwiftUI

struct AddressSearchViewController_Preview: PreviewProvider {
    static var previews: some View {
        AddressSearchViewController().showPreview()
    }
}
#endif
