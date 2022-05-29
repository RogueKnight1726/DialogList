//
//  AddValuesContract.swift
//  DialogList
//
//  Created by Swathy S on 29/05/22.
//

import Foundation

protocol AddValuesViewToModelProtocol: AnyObject {
    func saveValues(title: String, authorName: String, content: String)
}
protocol AddValuesModelToViewProtocol: AnyObject {
    func showSuccess()
    func showError(_ message: String)
}
