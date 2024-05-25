//
//  ViewController.swift
//  practice
//
//  Created by Abdylda Mamashev on 25/5/24.
//

import UIKit

class ViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 35
        view.dataSource = self
        view.delegate = self
        view.register(TableViewCell.self,
                      forCellReuseIdentifier: TableViewCell.reuseID)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let urlCharacters = "https://rickandmortyapi.com/api/character"
    
    var chars: [characters] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBackground()
        getCharacters()
    }
    
    private func setupUI() {
     
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25)
            
        ])
    }
    
    private func setupBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.darkGray.cgColor, UIColor.white.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func getCharacters() {
        
        guard let url = URL(string: urlCharacters) else {
            
            print("fail")
            
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("error fetching data \(error)")
                return
            }
            
            guard let data = data else {
                print("no data recieved")
                return
            }
            
            do {
                self.chars = try JSONDecoder().decode([characters].self, from: data)
                
                DispatchQueue.main.async { [ weak self ] in
                    guard let self = self else { return }
                    self.tableView.reloadData()
                }
                
            } catch {
                print ("error fetching data \(error)")
            }
        }.resume()
    }
    
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseID, for: indexPath) as! TableViewCell
        cell.layer.cornerRadius = 15
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let char = chars[indexPath.row]
        
        let detail = characters(id: char.id,
                                name: char.name,
                                status: char.status,
                                species: char.species,
                                image: char.image)
        
        let detailVC = DetailsViewController()
        detailVC.detail = detail
        navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
