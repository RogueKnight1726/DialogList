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
    var sortOrder: SortOrder = .undefined
    var valuesInCache: [DialogModel] = []
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
    func sortItems() {
        if sortOrder == .undefined || sortOrder == .decending {
            valuesInCache.sort(by: { $0.author < $1.author })
            sortOrder = .ascending
        } else {
            valuesInCache.sort(by: { $0.author > $1.author })
            sortOrder = .decending
        }
        dataSource?.addValuesToDisplay(valuesInCache)
        view?.refershList()
    }
    private func fetchSavedValues() {
        guard let savedData = UserDefaults.standard.object(forKey: "savedData") as? Data else { return }
        do {
            guard let savedObjectArray = try? JSONDecoder().decode([DialogModel].self, from: savedData) else { return }
            valuesInCache = savedObjectArray
            dataSource?.addValuesToDisplay(valuesInCache)
        }
        
    }
}

let mockValues: [DialogModel] = [
    DialogModel(id: UUID(), title: "Title 1", creationDate: Date(), author: "Batman", content: "This is just a sample description")
]
