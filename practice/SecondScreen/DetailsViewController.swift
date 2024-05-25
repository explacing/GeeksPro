//
//  DetailsViewController.swift
//  practice
//
//  Created by Abdylda Mamashev on 25/5/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private lazy var detailsTableView = {
        let view = UITableView()
        view.register(DetailsTableViewCell.self,
                      forCellReuseIdentifier: DetailsTableViewCell.reuseID)
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    var detail: characters?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        
    }
    
    private func setupBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.darkGray.cgColor, UIColor.white.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupUI() {
        view.addSubview(detailsTableView)
        
        NSLayoutConstraint.activate([
            detailsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            detailsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            detailsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            detailsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25)
        ])
    }
}

extension DetailsViewController: UITableViewDelegate {}

extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailsTableViewCell.reuseID,
                                                       for: indexPath) as? DetailsTableViewCell else {
            fatalError("Cannot dequeue JustTableViewCell")
        }
        
        
        return cell
    }
    
    
}
