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
        tableView.register(DialogTableViewCell.self, forCellReuseIdentifier: Identifiers().dialogCellId)
        tableView.delegate = tableViewDataSource
        tableView.dataSource = tableViewDataSource
        return tableView
    }()
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.addTarget(self, action: #selector(characterChanged(sender:)), for: .editingChanged)
        textField.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        return textField
    }()
    lazy var tableViewDataSource: DialogDataSource = {
        DialogDataSource()
    }()
    lazy var viewModel: HomeViewToModelProtocol = {
        let viewModel = HomeViewModel()
        viewModel.dataSource = tableViewDataSource
        viewModel.view = self
        return viewModel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewLoaded()
    }
    @objc func addNewItem(sender: UIButton) {
        viewModel.addButtonTapped()
    }
    @objc func sortItems(sender: UIButton) {
        viewModel.sortItems()
    }
    @objc func characterChanged(sender: UITextField) {
        viewModel.searchListFor(author: sender.text ?? "")
    }
}
extension HomeController: HomeModelToViewProtocol {
    func showViewToAddDialog() {
        
    }
    func hideViewAddDialogView() {
        
    }
    func refershList() {
        dialogsTableView.reloadData()
    }
    func showNewController<T: UIViewController>(_ controller: T) {
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
extension HomeController {
    private func initViews() {
        let guide = view.safeAreaLayoutGuide
        view.backgroundColor = .red
        let backgroundImageView = UIImageView()
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = Images().backgoundImage
        backgroundImageView.clipsToBounds = true
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
         addButtonContainer.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10),
         addButtonContainer.widthAnchor.constraint(equalToConstant: 130)
        ].forEach({ $0.isActive = true })
        let addDialogButton = UIButton()
        addDialogButton.addTarget(self, action: #selector(addNewItem(sender:)), for: .touchUpInside)
        addDialogButton.setTitle("Add +", for: .normal)
        addDialogButton.setTitleColor(.black, for: .normal)
        addButtonContainer.addSubview(addDialogButton)
        addDialogButton.translatesAutoresizingMaskIntoConstraints = false
        [addDialogButton.topAnchor.constraint(equalTo: addButtonContainer.topAnchor, constant: 8),
         addDialogButton.bottomAnchor.constraint(equalTo: addButtonContainer.bottomAnchor, constant: -8),
         addDialogButton.leftAnchor.constraint(equalTo: addButtonContainer.leftAnchor, constant: 16),
         addDialogButton.rightAnchor.constraint(equalTo: addButtonContainer.rightAnchor, constant: -16)
        ].forEach({ $0.isActive = true })
        let sortButton = UIButton()
        sortButton.setImage(UIImage.init(systemName: "arrow.up.arrow.down.circle.fill"), for: .normal)
        sortButton.tintColor = .white
        sortButton.imageView?.contentMode = .scaleAspectFill
        sortButton.contentVerticalAlignment = .fill
        sortButton.contentHorizontalAlignment = .fill
        view.addSubview(sortButton)
        sortButton.translatesAutoresizingMaskIntoConstraints = false
        [sortButton.rightAnchor.constraint(equalTo: addButtonContainer.leftAnchor, constant: -10),
         sortButton.centerYAnchor.constraint(equalTo: addButtonContainer.centerYAnchor, constant: 0),
         sortButton.heightAnchor.constraint(equalToConstant: 30),
         sortButton.widthAnchor.constraint(equalToConstant: 30)
        ].forEach({ $0.isActive = true })
        sortButton.addTarget(self, action: #selector(sortItems(sender:)), for: .touchUpInside)
        let searchContainer = BaseView(with: .white, circular: false, shadow: true, borderColor: nil, borderThickness: nil)
        view.addSubview(searchContainer)
        searchContainer.translatesAutoresizingMaskIntoConstraints = false
        [searchContainer.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 10),
         searchContainer.rightAnchor.constraint(equalTo: sortButton.leftAnchor, constant: -10),
         searchContainer.centerYAnchor.constraint(equalTo: sortButton.centerYAnchor, constant: 0),
         searchContainer.heightAnchor.constraint(equalTo: addButtonContainer.heightAnchor, constant: 0)
        ].forEach({ $0.isActive = true })
        searchContainer.addSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        [searchTextField.leftAnchor.constraint(equalTo: searchContainer.leftAnchor, constant: 10),
         searchTextField.widthAnchor.constraint(equalTo: searchContainer.widthAnchor, constant: -20),
         searchTextField.centerYAnchor.constraint(equalTo: searchContainer.centerYAnchor, constant: 0)
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
