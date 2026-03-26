//
//  MultipleCollectionTableViewCell.swift
//  MultipleCollectionView
//
//  Created by Aditya Machhaiya on 30/12/25.
//

import UIKit

final class MultipleCollectionTableViewCellForSinger: UICollectionViewCell {

    static let identifier = "MultipleCollectionTableViewCellForSinger"

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        contentView.layer.cornerRadius = 12
        addTitleLabel()
      
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(_ text: String) {
        titleLabel.text = text
    }
    
    func addTitleLabel() {
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}

