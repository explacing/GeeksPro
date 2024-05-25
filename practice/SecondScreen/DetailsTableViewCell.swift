//
//  DetailsTableViewCell.swift
//  practice
//
//  Created by Abdylda Mamashev on 25/5/24.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private lazy var statusLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    static var reuseID = "reuseID"
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
