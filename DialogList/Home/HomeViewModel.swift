//
//  HomeViewModel.swift
//  DialogList
//
//  Created by Swathy S on 29/05/22.
//

import Foundation

class HomeViewModel: HomeViewToModelProtocol {
    weak var view: HomeModelToViewProtocol?
    weak var dataSource: HomeModelToDataSourceProtocol?
    func viewLoaded() {
        fetchSavedValues()
        view?.refershList()
    }
    func addButtonTapped() {
        let vc = AddValuesController()
        view?.showNewController(vc)
    }
    func saveButtonTapped() {
        
    }
    func cancelButtonTapped() {
        
    }
    private func fetchSavedValues() {
        guard let savedData = UserDefaults.standard.object(forKey: "savedData") as? Data else { return }
        do {
            guard let savedObjectArray = try? JSONDecoder().decode([DialogModel].self, from: savedData) else { return }
            dataSource?.addValuesToDisplay(savedObjectArray)
        }
        
    }
}

let mockValues: [DialogModel] = [
    DialogModel(id: UUID(), title: "Title 1", creationDate: Date(), author: "Batman", content: "This is just a sample description")
]
