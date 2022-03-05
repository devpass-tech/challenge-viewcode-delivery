//
//  CategoryListView.swift
//  DeliveryApp
//
//  Created by Murillo R. Araújo on 28/02/22.
//

import UIKit

class CategoryListView: UIView {

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 16, left: 16, bottom: 16, right: 16)
        layout.itemSize = .init(width: 60, height: 90)
        layout.scrollDirection = .horizontal

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.showsHorizontalScrollIndicator = false
        collection.register(CategoryCellView.self, forCellWithReuseIdentifier: CategoryCellView.identifier)

        return collection
    }()

    init() {
        super.init(frame: .zero)
        addSubviews()
        setConstraints()
        setStyle()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }


    private func addSubviews() {
        addSubview(collectionView)
    }

    private func setConstraints() {
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate ([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 110)
        ])
    }

    func setStyle() {
        backgroundColor = .white
    }
}

extension CategoryListView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCellView.identifier, for: indexPath) as? CategoryCellView else {
            return .init()
        }

        return cell
    }
}
