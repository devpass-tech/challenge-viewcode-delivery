//
//  RestaurantDetails.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {

    private let deliveryApi = DeliveryApi()

    private let restaurantDetailsView: RestaurantDetailsView = {

        let restaurantDetailsView = RestaurantDetailsView()
        return restaurantDetailsView
    }()

    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = restaurantDetailsView
    }

    override func viewDidLoad() {

        deliveryApi.fetchRestaurantDetails { restaurantDetails in

            guard let restaurantDetails = restaurantDetails else {
                return
            }

            DispatchQueue.main.async {

                self.restaurantDetailsView.updateView(with: restaurantDetails)
            }
        }
    }
}
