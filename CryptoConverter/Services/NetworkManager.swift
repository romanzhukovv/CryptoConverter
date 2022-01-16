//
//  NetworkManager.swift
//  CryptoConverter
//
//  Created by Roman Zhukov on 15.01.2022.
//

import Foundation
import UIKit

class NetworkManager {
    static var shared = NetworkManager()
    
    private init() {}
    
    func fetchCoin(completion: @escaping(_ coins: [Coin]) -> Void) {
        guard let url = URL(string: "https://rest-sandbox.coinapi.io/v1/assets/?apikey=A1BD8810-5840-4809-952A-8ECBD0D51E21") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                completion(coins)
            } catch {
                print(error)
            }
            
        }.resume()
    }
}
