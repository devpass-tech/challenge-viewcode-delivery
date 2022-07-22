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
    
    private lazy var addressView: AddressView = {
        let addressView = AddressView()
        addressView.updateView(with: .init(address: "R. Guiratinga, 500"))
        addressView.translatesAutoresizingMaskIntoConstraints = false
        return addressView
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RestaurantCell.self, forCellReuseIdentifier: self.restaurantCellIdentifier)
        tableView.dataSource = self
        return tableView
    }()

    convenience init() {
        self.init(frame: .zero)
        setup()
    }

    func updateView(with restaurants: [Restaurant]) {
        self.restaurants = restaurants
        tableView.reloadData()
    }
}

extension HomeView: ViewCode {
    func setupSubviews() {
        addSubview(addressView)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        setupTableViewConstraints()
        setupAddressViewConstraints()
    }
    
    func setupExtraConfiguration() {
        backgroundColor = .white
    }
    
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: addressView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupAddressViewConstraints() {
        NSLayoutConstraint.activate([
            addressView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            addressView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            addressView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        ])
    }
}

extension HomeView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.restaurantCellIdentifier) as? RestaurantCell else {
            return UITableViewCell()
        }
        cell.updateCell(with: restaurants[indexPath.row])
        
        return cell
    }
}
