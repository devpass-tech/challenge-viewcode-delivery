//
//  HomeView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 31/10/21.
//

import UIKit

struct HomeViewConfiguration {
    
    let restaurants: [String]
}

final class HomeView: UIView {
    
    private let restaurantCellIdentifier = "RestaurantCellIdentifier"
    
    private var restaurants: [Restaurant] = []
    
    private lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RestaurantCellView.self, forCellReuseIdentifier: RestaurantCellView.cellIdentifier)
        tableView.dataSource = self
        return tableView
    }()
    
    private lazy var loadingView: LoadingView = {
        let loadingView = LoadingView()
        loadingView.setLoadingMessage("Carregando Restaurantes...")
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.isHidden = true
        return loadingView
    }()
    
    private lazy var addressView: AddressView = {
        let view = AddressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var dividerView: DividerView = {
        let view = DividerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        
        super.init(frame: .zero)
        
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with restaurants: [Restaurant]) {
        
        self.restaurants = restaurants
        self.tableView.reloadData()
    }
    
    func updateLoading(with isLoading: Bool) {
        loadingView.updateLoading(isLoading)
    }
}

private extension HomeView {
    
    func setupViews() {
        
        self.backgroundColor = .white
        
        self.configureSubviews()
        self.configureLoadingViewConstraints()
        self.configureAddressViewConstraints()
        self.configureDividerViewConstraints()
        self.configureTableViewConstraints()
        
    }
    
    func configureSubviews() {
        
        self.addSubview(self.addressView)
        self.addSubview(self.dividerView)
        self.addSubview(self.tableView)
        self.addSubview(self.loadingView)
    }
    
    func configureLoadingViewConstraints() {
        NSLayoutConstraint.activate([
            self.loadingView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.loadingView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            self.loadingView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.loadingView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    func configureAddressViewConstraints() {
        NSLayoutConstraint.activate([
            self.addressView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.addressView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.addressView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.addressView.heightAnchor.constraint(equalToConstant: 66)
        ])
    }
    
    func configureDividerViewConstraints() {
        NSLayoutConstraint.activate([
            self.dividerView.topAnchor.constraint(equalTo: self.addressView.bottomAnchor, constant: 8),
            self.dividerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.dividerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    func configureTableViewConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.dividerView.bottomAnchor, constant: 10),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension HomeView: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.restaurants.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let restaurant = restaurants[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantCellView.cellIdentifier, for: indexPath) as? RestaurantCellView else {
            return .init()
        }
        
        cell.updateView(with: .init(
            name: restaurant.name,
            detail: restaurant.category,
            icon: "restaurant-logo"))
        
        return cell
    }
    
}

extension UITableViewCell {
    
    static var cellIdentifier: String {
        String(describing: self)
    }
}



