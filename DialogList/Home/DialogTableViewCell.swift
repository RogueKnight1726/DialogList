//
//  DialogTableViewCell.swift
//  DialogList
//
//  Created by Swathy S on 29/05/22.
//

import UIKit

class DialogTableViewCell: UITableViewCell {
    lazy var authorNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .black)
        label.text = "Author"
        return label
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.text = "Title"
        return label
    }()
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.text = "description"
        return label
    }()
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.text = "Time"
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension DialogTableViewCell {
    private func initViews() {
        self.addSubview(authorNameLabel)
        authorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        [authorNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
         authorNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        ].forEach({ $0.isActive = true })
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        [titleLabel.leftAnchor.constraint(equalTo: authorNameLabel.leftAnchor, constant: 0),
         titleLabel.topAnchor.constraint(equalTo: authorNameLabel.bottomAnchor, constant: 10)
        ].forEach({ $0.isActive = true })
        self.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        [descriptionLabel.leftAnchor.constraint(equalTo: authorNameLabel.leftAnchor, constant: 0),
         descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
         descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
        ].forEach({ $0.isActive = true })
        self.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        [timeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
         timeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
         timeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ].forEach({ $0.isActive = true })
    }
}
