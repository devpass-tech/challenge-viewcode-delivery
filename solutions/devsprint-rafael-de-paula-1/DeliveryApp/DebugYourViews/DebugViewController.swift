//
//  DebugViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 07/01/22.
//

import UIKit

/**

 Use this ViewController to debug your View components.

 1) Change `myView` type to your UIView subclass
 2) Set `myViewHeight` according to your View
 3) Set an instance of DebugViewController as window's rootViewController in `SceneDelegate.swift` file

 */

class DebugViewController: UIViewController {

    private let emptyView: EmptyView = {
        let view = EmptyView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        view.addSubview(emptyView)

        NSLayoutConstraint.activate([
            emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emptyView.topAnchor.constraint(equalTo: view.topAnchor),
            emptyView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
