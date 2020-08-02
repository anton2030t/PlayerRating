//
//  ViewController.swift
//  PlayerRating
//
//  Created by Anton Larchenko on 02.08.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var players = [Player]()
    var ratings = [Rating]()
    
    private let webManager = WebManager()
    
    @IBOutlet weak var playersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playersTableView.register(UINib(nibName: PlayerCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: PlayerCell.identifier)
        
        loadPlayers()
        loadRating()
    }

    func loadPlayers() {
        webManager.loadPlayers { [weak self] (players) in
            self?.players += players
        }
    }
    
    func loadRating() {
        webManager.loadRating { [weak self] (ratings) in
            self?.ratings += ratings
            
            DispatchQueue.main.async {
                self?.playersTableView.separatorStyle = .singleLine
                self?.playersTableView.reloadData()
            }
            
        }
    }
    
    @IBAction func refreshButton(_ sender: UIBarButtonItem) {
        loadPlayers()
        loadRating()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayerCell.identifier) as! PlayerCell
        
        let playerModel = players[indexPath.row]
        let ratingModel = ratings[indexPath.row]
        
        let url = URL(string: playerModel.url)!
        
        func setupCell(image: UIImage) {
            cell.avatarImageView.image = image
            cell.idLabel.text = String(playerModel.id)
            cell.nameLabel.text = playerModel.name
            cell.arrowLabel.image = UIImage(systemName: "minus") // "chevron.up" / "chevron.down"
            cell.ratingLabel.text = String(ratingModel.rating)
            cell.statusLabel.text = ratingModel.status
            cell.lastGameLabel.text = String(ratingModel.lastGame)
            cell.timeUnitLabel.text = "minutes" // рассчитать в зависимости от величины
        }
        
        cell.task = URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let data = data, let imageData = UIImage(data: data) {
                DispatchQueue.main.async {
                    setupCell(image: imageData)
                    cell.avatarImageView.backgroundColor = .clear
                }
            }
        }
        cell.task?.resume()
        
        
        return cell
    }
    
    
}
