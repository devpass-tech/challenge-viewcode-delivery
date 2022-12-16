//
//  HomeView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 31/10/21.
//

import UIKit

struct HomeViewConfiguration {

    let restaurants: [Restaurant]
}

final class HomeView: UIView {

    private let restaurantCellIdentifier = "RestaurantCellIdentifier"

    private var restaurants: [Restaurant] = []
    
    private lazy var firstDividerView: DividerView = {
        let view = DividerView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var secondDividerView: DividerView = {
        let view = DividerView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var addressView: AddressView = {
        let view = AddressView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var tableView: RestaurantListView = {
        let tableView = RestaurantListView()
        
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

private extension HomeView {

    func setupViews() {

        self.backgroundColor = .white

        self.configureSubviews()
        self.configureSubviewsConstraints()
    }

    func configureSubviews() {

        self.addSubview(self.firstDividerView)
        self.addSubview(self.addressView)
        self.addSubview(self.secondDividerView)
        self.addSubview(self.tableView)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
            
            firstDividerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            firstDividerView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            
            addressView.topAnchor.constraint(equalTo: firstDividerView.bottomAnchor),
            addressView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            addressView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            addressView.bottomAnchor.constraint(equalTo: secondDividerView.topAnchor),
            
            secondDividerView.widthAnchor.constraint(equalTo: self.widthAnchor),
            secondDividerView.bottomAnchor.constraint(equalTo: tableView.topAnchor),

            self.tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: secondDividerView.bottomAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

#if DEBUG
import SwiftUI

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        let homeView = HomeView()
        
        return homeView.showPreview()
    }
}
#endif

