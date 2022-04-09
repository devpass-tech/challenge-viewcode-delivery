//
//  HomeView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 31/10/21.
//

import UIKit

final class HomeView: UIView {
    private var restaurants: [Restaurant] = []

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RestaurantListItemTableViewCell.self, forCellReuseIdentifier: RestaurantListItemTableViewCell.identifier)
        tableView.dataSource = self
        return tableView
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
}

private extension HomeView {

    func setupViews() {
        self.backgroundColor = .white
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }

    func configureSubviews() {
        self.addSubview(self.tableView)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension HomeView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantListItemTableViewCell.identifier) as? RestaurantListItemTableViewCell else {
            return UITableViewCell()
        }
        
        let restaurant = restaurants[indexPath.row]
        cell.configure(
            with: .init(
                name: restaurant.name,
                category: restaurant.category,
                minDeliveryTime: restaurant.deliveryTime.min,
                maxDeliveryTime: restaurant.deliveryTime.max,
                icon: restaurant.logo
            )
        )
        return cell
    }
}
