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
        tableView.backgroundColor = .clear
        tableView.register(DialogTableViewCell.self, forCellReuseIdentifier: "DialogCell")
        tableView.delegate = tableViewDataSource
        tableView.dataSource = tableViewDataSource
        return tableView
    }()
    lazy var tableViewDataSource: DialogDataSource = {
        DialogDataSource()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
}
extension HomeController {
    private func initViews() {
        let guide = view.safeAreaLayoutGuide
        view.backgroundColor = .red
        let backgroundImageView = UIImageView()
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = Images().backgoundImage
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        [backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
         backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
         backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
         backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        ].forEach({ $0.isActive = true })
        let addButtonContainer = BaseView(with: .white, circular: false, shadow: false, borderColor: nil, borderThickness: nil)
        view.addSubview(addButtonContainer)
        addButtonContainer.translatesAutoresizingMaskIntoConstraints = false
        [addButtonContainer.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -10),
         addButtonContainer.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10)
        ].forEach({ $0.isActive = true })
        let addDialogButton = UIButton()
        addDialogButton.setTitle("Add +", for: .normal)
        addDialogButton.setTitleColor(.black, for: .normal)
        addButtonContainer.addSubview(addDialogButton)
        addDialogButton.translatesAutoresizingMaskIntoConstraints = false
        [addDialogButton.topAnchor.constraint(equalTo: addButtonContainer.topAnchor, constant: 8),
         addDialogButton.bottomAnchor.constraint(equalTo: addButtonContainer.bottomAnchor, constant: -8),
         addDialogButton.leftAnchor.constraint(equalTo: addButtonContainer.leftAnchor, constant: 16),
         addDialogButton.rightAnchor.constraint(equalTo: addButtonContainer.rightAnchor, constant: -16)
        ].forEach({ $0.isActive = true })
        view.addSubview(dialogsTableView)
        dialogsTableView.translatesAutoresizingMaskIntoConstraints = false
        [dialogsTableView.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 0),
         dialogsTableView.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: 0),
         dialogsTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 0),
         dialogsTableView.topAnchor.constraint(equalTo: addDialogButton.bottomAnchor, constant: 20)
        ].forEach({ $0.isActive = true })
    }
}
