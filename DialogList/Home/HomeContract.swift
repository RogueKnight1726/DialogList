//
//  HomeContract.swift
//  DialogList
//
//  Created by Swathy S on 29/05/22.
//

import Foundation
import UIKit

protocol HomeViewToModelProtocol: AnyObject {
    func viewLoaded()
    func addButtonTapped()
    func sortItems()
    func searchListFor(author: String)
}
protocol HomeModelToViewProtocol: AnyObject {
    func showViewToAddDialog()
    func hideViewAddDialogView()
    func refershList()
    func showNewController<T: UIViewController>(_ controller: T)
}

protocol HomeModelToDataSourceProtocol: AnyObject {
    func addValuesToDisplay(_ values: [DialogModel])
}
