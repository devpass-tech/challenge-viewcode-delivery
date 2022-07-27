//
//  AddressSearchView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 04/02/22.
//

import UIKit

class AddressListView: UIView {
    
    private let addressCellIdentifier = "AddressCellIdentifier"
    
    private var addresses: [Address] = []
    
    private lazy var searchbar: UISearchBar = {
        let input = UISearchBar()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.placeholder = "Rua, número, bairro"
        input.layer.borderWidth = 10
        input.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        input.barTintColor = .secondarySystemBackground
        return input
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(AddressCell.self, forCellReuseIdentifier: self.addressCellIdentifier)
        tableView.dataSource = self
        return tableView
    }()
    
    private lazy var divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemFill
        return view
    }()
    
    init(){
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with addresses: [Address]) {
        self.addresses = addresses
        self.tableView.reloadData()
    }
}

extension AddressListView: ViewCode {
    func setupSubviews() {
        addSubview(searchbar)
        addSubview(divider)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        setupTableViewConstraints()
        setupSearchbarConstaints()
        setupDividerConstraints()
    }
    
    func setupSearchbarConstaints(){
        NSLayoutConstraint.activate([
            searchbar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchbar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchbar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchbar.bottomAnchor.constraint(equalTo: divider.topAnchor)
        ])
    }
    
    func setupDividerConstraints(){
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: searchbar.bottomAnchor),
            divider.leadingAnchor.constraint(equalTo: leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor),
            divider.bottomAnchor.constraint(equalTo: tableView.topAnchor),
            divider.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func setupTableViewConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: divider.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}

extension AddressListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.addressCellIdentifier) as! AddressCell
        let data = self.addresses[indexPath.row]
        cell.updateView(address: "\(data.street), \(data.number)", neighborhood: data.neighborhood)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.addresses.count
    }
}
