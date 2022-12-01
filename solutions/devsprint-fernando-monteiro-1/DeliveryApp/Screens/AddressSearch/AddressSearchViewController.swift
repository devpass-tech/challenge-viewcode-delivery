//
//  AddressSearchViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class AddressSearchViewController: UIViewController {

    private let deliveryApi = DeliveryApi()

    private let addressListView: AddressListView = {

        let addressListView = AddressListView()
        return addressListView
    }()

    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = addressListView
    }

    override func viewDidLoad() {

        deliveryApi.searchAddresses { addresses in

            guard let addresses = addresses else {
                return
            }

            DispatchQueue.main.async {

                self.addressListView.updateView(with: addresses)
            }
        }
    }
}
