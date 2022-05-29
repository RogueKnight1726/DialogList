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
    func setDateString(string: String) {
        timeLabel.text = string
    }
    func setTitle(_ string: String) {
        titleLabel.text = string
    }
    func setAuthorName(_ string: String) {
        authorNameLabel.text = string
    }
    func setDescription(_ string: String) {
        descriptionLabel.text = string
    }
}
extension DialogTableViewCell {
    private func initViews() {
        self.backgroundColor = .clear
        let containerView = BaseView(with: .white, circular: false, shadow: true, borderColor: nil, borderThickness: nil)
        self.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        [containerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
         containerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
         containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
         containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ].forEach({ $0.isActive = true })
        self.addSubview(authorNameLabel)
        authorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        [authorNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
         authorNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20)
        ].forEach({ $0.isActive = true })
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        [titleLabel.leftAnchor.constraint(equalTo: authorNameLabel.leftAnchor, constant: 0),
         titleLabel.topAnchor.constraint(equalTo: authorNameLabel.bottomAnchor, constant: 20)
        ].forEach({ $0.isActive = true })
        self.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        [descriptionLabel.leftAnchor.constraint(equalTo: authorNameLabel.leftAnchor, constant: 0),
         descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
         descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20)
        ].forEach({ $0.isActive = true })
        self.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        [timeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
         timeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
         timeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ].forEach({ $0.isActive = true })
    }
}
