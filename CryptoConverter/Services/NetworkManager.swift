//
//  NetworkManager.swift
//  CryptoConverter
//
//  Created by Roman Zhukov on 15.01.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static var shared = NetworkManager()
    
    private init() {}
    
    func fetchCoinAF(completion: @escaping(Result<[Coin], NetworkError>) -> Void) {
        AF.request("https://rest-sandbox.coinapi.io/v1/assets/?apikey=A1BD8810-5840-4809-952A-8ECBD0D51E21")
            .validate()
            .responseJSON { dataResponce in
                switch dataResponce.result {
                case .success(let value):
                    let coins = Coin.getCoins(from: value)
                    completion(.success(coins))
                case .failure:
                    completion(.failure(.decodingError))
                }
            }
    }
    
//    func fetchCoin(completion: @escaping(_ coins: [Coin]) -> Void) {
//        guard let url = URL(string: "https://rest-sandbox.coinapi.io/v1/assets/?apikey=A1BD8810-5840-4809-952A-8ECBD0D51E21") else { return }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//
//            do {
//                let coins = try JSONDecoder().decode([Coin].self, from: data)
//                completion(coins)
//            } catch {
//                print(error)
//            }
//
//        }.resume()
//    }
    
    func fetchIcon(completion: @escaping(_ icons: [Icon]) -> Void) {
        guard let url = URL(string: "https://rest.coinapi.io/v1/assets/icons/62/?apikey=A1BD8810-5840-4809-952A-8ECBD0D51E21") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let icons = try JSONDecoder().decode([Icon].self, from: data)
                completion(icons)
            } catch {
                print(error)
            }
            
        }.resume()
    }
}
