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
    
    private var categories:[Category] = []
    
    lazy var categoryCollectionView: CategoryListView = {
        
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
        
        self.addSubview(self.addressView)
        self.addSubview(self.firstDividerView)
        self.addSubview(self.categoryCollectionView)
        self.addSubview(self.secondDividerView)
        self.addSubview(self.tableView)
        
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
            
            addressView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            addressView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            addressView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
 
            
            firstDividerView.topAnchor.constraint(equalTo: self.addressView.bottomAnchor),
            firstDividerView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            self.categoryCollectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.categoryCollectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.categoryCollectionView.topAnchor.constraint(equalTo: self.firstDividerView.bottomAnchor),
            self.categoryCollectionView.heightAnchor.constraint(equalToConstant: 122.5),
           
            
            secondDividerView.widthAnchor.constraint(equalTo: self.widthAnchor),
            secondDividerView.topAnchor.constraint(equalTo: self.categoryCollectionView.bottomAnchor),
            

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

