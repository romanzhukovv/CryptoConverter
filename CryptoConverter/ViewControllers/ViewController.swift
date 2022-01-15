//
//  ViewController.swift
//  CryptoConverter
//
//  Created by Roman Zhukov on 15.01.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCoin()
    }


}

extension ViewController {
    private func fetchCoin() {
        guard let url = URL(string: "https://rest-sandbox.coinapi.io/v1/assets/BTC/?apikey=A1BD8810-5840-4809-952A-8ECBD0D51E21") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let coin = try JSONDecoder().decode([Coin].self, from: data)
                print(coin)
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}

