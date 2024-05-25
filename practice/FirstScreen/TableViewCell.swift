//
//  TableViewCell.swift
//  practice
//
//  Created by Abdylda Mamashev on 25/5/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    private lazy var profileImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "pencil.circle.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var profileLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 15, weight: .medium)
        view.text = "Rick Sanchez"
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    static let reuseID = "reuseId"
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(profileImage)
        
        NSLayoutConstraint.activate([
            profileImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            profileImage.heightAnchor.constraint(equalToConstant: 35),
            profileImage.widthAnchor.constraint(equalToConstant: 35)
        ])
        
        contentView.addSubview(profileLabel)
        
        NSLayoutConstraint.activate([
            profileLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10)
        ])
        
    }
    
}
