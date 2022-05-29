//
//  AddValuesViewModel.swift
//  DialogList
//
//  Created by Swathy S on 29/05/22.
//

import Foundation
class AddValuesViewModel: AddValuesViewToModelProtocol {
    weak var view: AddValuesModelToViewProtocol?
    func saveValues(title: String, authorName: String, content: String) {
        if title.trimmingCharacters(in: .whitespaces).isEmpty,
           authorName.trimmingCharacters(in: .whitespaces).isEmpty,
           content.trimmingCharacters(in: .whitespaces).isEmpty {
          return
        }
        let objectToBeSaved = DialogModel(id: UUID(), title: title, creationDate: Date(), author: authorName, content: content)
        saveObjectToUserDefaults(objectToBeSaved)
    }
    private func checkForEmptyFields() {
        
    }
    private func saveObjectToUserDefaults(_ dialogueObject: DialogModel) {
        if let savedContentData = UserDefaults.standard.object(forKey: "savedData") as? Data {
            do {
                var savedContent = try? JSONDecoder().decode([DialogModel].self, from: savedContentData)
                if savedContent?.contains(where: { $0.author == dialogueObject.author }) ?? false {
                    view?.showError("Author already present")
                    return
                }
                savedContent?.append(dialogueObject)
                let dataToBeSaved = try? JSONEncoder().encode(savedContent)
                UserDefaults.standard.set(dataToBeSaved, forKey: "savedData")
                view?.showSuccess()
            }
        } else {
            do {
                let dataToBeSaved = try? JSONEncoder().encode([dialogueObject])
                UserDefaults.standard.set(dataToBeSaved, forKey: "savedData")
                view?.showSuccess()
            }
        }
    }
}
