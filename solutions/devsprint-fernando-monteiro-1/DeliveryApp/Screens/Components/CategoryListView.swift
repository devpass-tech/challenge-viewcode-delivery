//
//  CategoryListView.swift
//  DeliveryApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import UIKit

class CategoryListView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
 
    private var categories:[Category] = []
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        
        super.init(frame: frame, collectionViewLayout: layout)
        self.delegate = self
        self.dataSource = self
        register(CategoryCellView.self, forCellWithReuseIdentifier: CategoryCellView.identifier)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateView(_ category:Category) {
        
        categories.append(category)
        self.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: CategoryCellView.identifier, for: indexPath) as? CategoryCellView else {
            return UICollectionViewCell()
        }
        
        cell.setupView(categories[indexPath.row])
        return cell
    }
    
}


#if DEBUG
import SwiftUI

struct CategoryListView_Preview: PreviewProvider {
    static var previews: some View {
        
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: 62, height: 122)
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumLineSpacing = 0
        collectionViewLayout.sectionInset = UIEdgeInsets.zero

        
        let view = CategoryListView(frame: CGRect(x: 0, y: 0, width: 1000, height: 140), collectionViewLayout: collectionViewLayout)
        view.updateView(.stub())
        view.updateView(.stub())
        view.updateView(.stub())
        view.updateView(.stub())
                
        return view.showPreview()
    }
}

#endif
