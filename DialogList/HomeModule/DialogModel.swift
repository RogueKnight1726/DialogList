//
//  DialogModel.swift
//  DialogList
//
//  Created by Swathy S on 29/05/22.
//

import Foundation

struct DialogModel: Codable {
    var id: UUID
    var title: String
    var creationDate: Date
    var author: String
    var content: String
}

enum SortOrder {
    case ascending
    case decending
    case undefined
}
