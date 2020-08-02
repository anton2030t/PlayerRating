//
//  Rating.swift
//  PlayerRating
//
//  Created by Anton Larchenko on 02.08.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import Foundation

struct Rating: Codable {
    let userId: Int
    let rating: Int
    let status: String
    let lastGame: Double
}
