//
//  PlayerCell.swift
//  PlayerRating
//
//  Created by Anton Larchenko on 02.08.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {

    var task: URLSessionDataTask?

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var arrowLabel: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var lastGameLabel: UILabel!
    @IBOutlet weak var timeUnitLabel: UILabel!
    
    static let identifier = "PlayerCell"
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        avatarImageView.backgroundColor = .darkGray
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height/2
        avatarImageView.image = nil
        ratingLabel.text = nil
        
        isHidden = false
        isSelected = false
        isHighlighted = false
        
        task?.cancel()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
