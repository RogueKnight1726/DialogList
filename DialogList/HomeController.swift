//
//  HomeController.swift
//  DialogList
//
//  Created by Swathy S on 29/05/22.
//

import UIKit

class HomeController: UIViewController {
    lazy var dialogsTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
}
extension HomeController {
    private func initViews() {
        let guide = view.safeAreaLayoutGuide
        view.addSubview(dialogsTableView)
        dialogsTableView.translatesAutoresizingMaskIntoConstraints = false
        [dialogsTableView.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 0),
         dialogsTableView.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: 0),
         dialogsTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 0),
         dialogsTableView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 0)
        ].forEach({ $0.isActive = true })
    }
}
