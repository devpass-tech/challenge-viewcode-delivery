//
//  ViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 25/10/21.
//

import UIKit

class HomeViewController: UIViewController {

    private let deliveryApi = DeliveryApi()

    private let homeView: HomeView = {
        let homeView = HomeView()
        return homeView
    }()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Nome do restaurante"
        
        return searchController
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "Delivery App"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        fetchRestaurantes()
    }
    
    override func loadView() {
        self.view = homeView
    }
    
    func fetchRestaurantes() {
        deliveryApi.fetchRestaurants { restaurants in
            guard let restaurants = restaurants else {
                return
            }

            DispatchQueue.main.async {
                self.homeView.updateView(with: restaurants)
            }
        }
    }
}
