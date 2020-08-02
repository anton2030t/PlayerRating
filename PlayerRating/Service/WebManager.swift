//
//  WebManager.swift
//  PlayerRating
//
//  Created by Anton Larchenko on 02.08.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import Foundation

class WebManager {
    
    private let playersURL = "https://script.googleusercontent.com/macros/echo?user_content_key=5CcrHf2m87B4p0BIGZr-MHlAVC4Hc59MG4PuPvdo3w_Z2FkzUq9dKbOgN5e9jybXP8_JEeyrB192R0dPOqjdqtffcEO1hdcTm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnFVwCLzrICbApsi4kiySmf_GWt4b2f0OajTkE7kRXqTBZypxOMl4-iyEcEFPI4oTZBXQQwxegyxt&lib=MzOyXUTJdNwSAXRRtwEbdzlLufVvcKmcx"
    private let ratingURL = "https://script.googleusercontent.com/macros/echo?user_content_key=dxdwlx_5xWEaGouYFayuKbtex_Qk45DQnTqB57TsPmqz6cpkjqWUIic1PFUz7qutHmJ31fWMHDD8yQQCNJ6jXSmAVu4_DKh2m5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnBNyhDwpQ2DoEH2IANbbls_o_NfPlcYJRDFJg9OAa8mTJNbWczY1ct5SDwJlPnJEklvarYIGcMUB&lib=MAKKBeJBj6MAmRLXmx-6QsVLufVvcKmcx"
    
    func loadPlayers(completion: @escaping ([Player])->()) {
        
        let url = URL(string: playersURL)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let playersList = try JSONDecoder().decode([Player].self, from: data)
                completion(playersList)
                print(playersList)
            } catch let error {
                completion([])
                print(error)
            }
            
        }.resume()
    }
    
    func loadRating(completion: @escaping ([Rating])->()) {
        
        let url = URL(string: ratingURL)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let ratingList = try JSONDecoder().decode([Rating].self, from: data)
                completion(ratingList)
                print(ratingList)
            } catch let error {
                completion([])
                print(error)
            }
            
        }.resume()
    }
    
}
