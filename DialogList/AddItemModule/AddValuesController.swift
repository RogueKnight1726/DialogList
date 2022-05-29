//
//  AddValuesController.swift
//  DialogList
//
//  Created by Swathy S on 29/05/22.
//

import Foundation
import UIKit

class AddValuesController: UIViewController {
    lazy var authorNameTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.borderStyle = .roundedRect
        return textField
    }()
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.borderStyle = .roundedRect
        return textField
    }()
    lazy var contentTextField: UITextView = {
        let textView = UITextView()
        textView.textContainer.maximumNumberOfLines = 4
        textView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        textView.layer.borderWidth = 1.0
        textView.delegate = self
        return textView
    }()
    lazy var viewModel: AddValuesViewToModelProtocol = {
        let model = AddValuesViewModel()
        model.view = self
        return model
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    @objc func saveValues(sender: UIButton) {
        viewModel.saveValues(title: titleTextField.text ?? "",
                            authorName: authorNameTextField.text ?? "",
                            content: contentTextField.text ?? "")
    }
}
extension AddValuesController: AddValuesModelToViewProtocol {
    func showSuccess() {
        print("Saved")
        self.navigationController?.popViewController(animated: true)
    }
    func showError(_ message: String) {
        let alert = UIAlertController.init(title: "Error!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "OK", style: .default) { [weak self] _ in
            guard let unwrappedSelf = self else { return }
            unwrappedSelf.dismiss(animated: true)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}
extension AddValuesController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
extension AddValuesController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
}
extension AddValuesController {
    private func initViews() {
        let guide = view.safeAreaLayoutGuide
        let backgroundImageView = UIImageView()
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = Images().backgoundImage
        backgroundImageView.clipsToBounds = true
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        [backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
         backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
         backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
         backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        ].forEach({ $0.isActive = true })
        let authorLabel = UILabel()
        authorLabel.text = "Author Name:"
        authorLabel.textColor = .black
        authorLabel.font = .systemFont(ofSize: 14, weight: .bold)
        view.addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        [authorLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
         authorLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10)
        ].forEach({ $0.isActive = true })
        view.addSubview(authorNameTextField)
        authorNameTextField.translatesAutoresizingMaskIntoConstraints = false
        [authorNameTextField.leftAnchor.constraint(equalTo: authorLabel.leftAnchor, constant: 0),
         authorNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
         authorNameTextField.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10),
         authorNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ].forEach({ $0.isActive = true })
        let titleLabel = UILabel()
        titleLabel.text = "Title:"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        [titleLabel.leftAnchor.constraint(equalTo: authorLabel.leftAnchor, constant: 0),
         titleLabel.topAnchor.constraint(equalTo: authorNameTextField.bottomAnchor, constant: 10)
        ].forEach({ $0.isActive = true })
        view.addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        [titleTextField.leftAnchor.constraint(equalTo: authorLabel.leftAnchor, constant: 0),
         titleTextField.rightAnchor.constraint(equalTo: authorNameTextField.rightAnchor, constant: 0),
         titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
         titleTextField.heightAnchor.constraint(equalToConstant: 40)
        ].forEach({ $0.isActive = true })

        let descriptionLabel = UILabel()
        descriptionLabel.text = "Description:"
        descriptionLabel.textColor = .black
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .bold)
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        [descriptionLabel.leftAnchor.constraint(equalTo: authorLabel.leftAnchor, constant: 0),
         descriptionLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 10)
        ].forEach({ $0.isActive = true })
        view.addSubview(contentTextField)
        contentTextField.translatesAutoresizingMaskIntoConstraints = false
        [contentTextField.leftAnchor.constraint(equalTo: authorLabel.leftAnchor, constant: 0),
         contentTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
         contentTextField.heightAnchor.constraint(equalToConstant: 180),
         contentTextField.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -10)
        ].forEach({ $0.isActive = true })
        let saveButton = BaseView(with: Color().buttonColor, circular: false, shadow: true, borderColor: nil, borderThickness: nil)
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        [saveButton.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 10),
         saveButton.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -10),
         saveButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -10),
         saveButton.heightAnchor.constraint(equalToConstant: 60)
        ].forEach({ $0.isActive = true })
        let saveLabel = UILabel()
        saveLabel.textColor = .white
        saveLabel.text = "Save"
        saveLabel.font = UIFont.systemFont(ofSize: 16, weight: .black)
        saveButton.addSubview(saveLabel)
        saveLabel.translatesAutoresizingMaskIntoConstraints = false
        [saveLabel.centerXAnchor.constraint(equalTo: saveButton.centerXAnchor, constant: 0),
         saveLabel.centerYAnchor.constraint(equalTo: saveButton.centerYAnchor, constant: 0)
        ].forEach({ $0.isActive = true })
        saveButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(saveValues(sender:))))
    }
}
