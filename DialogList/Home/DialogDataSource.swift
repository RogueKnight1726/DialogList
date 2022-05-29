//
//  DialogDataSource.swift
//  DialogList
//
//  Created by Swathy S on 29/05/22.
//

import Foundation
import UIKit
class DialogDataSource: NSObject,UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DialogCell") as? DialogTableViewCell {
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
}
