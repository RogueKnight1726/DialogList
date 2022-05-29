//
//  DialogDataSource.swift
//  DialogList
//
//  Created by Swathy S on 29/05/22.
//

import Foundation
import UIKit
class DialogDataSource: NSObject,UITableViewDelegate, UITableViewDataSource {
    var modelArray: [DialogModel] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers().dialogCellId) as? DialogTableViewCell {
            let model = modelArray[indexPath.row]
            cell.setDateString(string: getStringFromDate(model.creationDate))
            cell.setDescription(model.content)
            cell.setAuthorName(model.author)
            cell.setTitle(model.title)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    func getStringFromDate(_ value: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: value)
    }
}
extension DialogDataSource: HomeModelToDataSourceProtocol {
    func addValuesToDisplay(_ values: [DialogModel]) {
        modelArray = values
    }
}
