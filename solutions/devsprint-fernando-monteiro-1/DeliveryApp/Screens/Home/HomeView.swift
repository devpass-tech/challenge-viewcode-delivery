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
    
    private lazy var dividerView: DividerView = {
        let view = DividerView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var addressView: AddressView = {
        let view = AddressView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.restaurantCellIdentifier)
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

        self.addSubview(self.addressView)
        self.addSubview(self.dividerView)
        self.addSubview(self.tableView)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
            
            addressView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            addressView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            addressView.bottomAnchor.constraint(equalTo: dividerView.topAnchor),
            
            dividerView.widthAnchor.constraint(equalTo: self.widthAnchor),
            dividerView.bottomAnchor.constraint(equalTo: tableView.topAnchor),

            self.tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: dividerView.bottomAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension HomeView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.restaurants.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: self.restaurantCellIdentifier)!
        cell.textLabel?.text = self.restaurants[indexPath.row].name
        return cell
    }
}

#if DEBUG
import SwiftUI

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        let homeView = HomeView()
        homeView.updateView(with: [
            Restaurant.stub(),
            Restaurant.stub(),
            Restaurant.stub(),
        ])
        return homeView.showPreview()
    }
}
#endif

