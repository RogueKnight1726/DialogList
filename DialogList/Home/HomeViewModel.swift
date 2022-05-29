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
    var filteredArray: [DialogModel] = []
    var searchTerm: String = ""
    func viewLoaded() {
        fetchSavedValues()
        view?.refershList()
    }
    func addButtonTapped() {
        let vc = AddValuesController()
        view?.showNewController(vc)
    }
    func sortItems() {
        if sortOrder == .undefined || sortOrder == .decending {
            valuesInCache.sort(by: { $0.author < $1.author })
            filteredArray.sort(by: { $0.author < $1.author })
            sortOrder = .ascending
        } else {
            valuesInCache.sort(by: { $0.author > $1.author })
            filteredArray.sort(by: { $0.author > $1.author })
            sortOrder = .decending
        }
        if searchTerm.isEmpty {
            dataSource?.addValuesToDisplay(valuesInCache)
        } else {
            dataSource?.addValuesToDisplay(filteredArray)
        }
        view?.refershList()
    }
    func searchListFor(author: String) {
        searchTerm = author
        if author.isEmpty {
            dataSource?.addValuesToDisplay(valuesInCache)
            
        } else {
            filteredArray = valuesInCache.filter({ $0.author.contains(author) })
            dataSource?.addValuesToDisplay(filteredArray)
        }
        view?.refershList()
    }
    private func fetchSavedValues() {
        guard let savedData = UserDefaults.standard.object(forKey: Identifiers().savedItemsCacheName) as? Data else { return }
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
