//
//  CustomHeader.swift
//  CookBook
//
//  Created by Лерочка on 28.02.2023.
//
import UIKit
class CustomHeader: UITableViewHeaderFooterView {
    let title = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.font = .boldSystemFont(ofSize: 30)
        contentView.addSubview(title)
        NSLayoutConstraint.activate([
            title.heightAnchor.constraint(equalToConstant: 30),
            title.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 8),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            title.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
