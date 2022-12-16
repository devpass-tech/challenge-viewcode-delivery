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
    
    private var categories:[Category] = []
    
    private lazy var categoryCollectionView: CategoryListView = {
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: 62, height: 122)
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumLineSpacing = 0
        collectionViewLayout.sectionInset = UIEdgeInsets.zero
        
        let view = CategoryListView(frame: .zero, collectionViewLayout: collectionViewLayout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
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
        
        self.addSubview(self.categoryCollectionView)
        self.addSubview(self.tableView)
        
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
            self.categoryCollectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.categoryCollectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.categoryCollectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.categoryCollectionView.heightAnchor.constraint(equalToConstant: 122.5),
            
            self.tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.categoryCollectionView.bottomAnchor),
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

