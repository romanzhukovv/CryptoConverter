//
//  Coin.swift
//  CryptoConverter
//
//  Created by Roman Zhukov on 15.01.2022.
//

struct Coin: Decodable {
    let asset_id: String
    let name: String
    let price_usd: Double?
    
    init(coinData: [String: Any]) {
        asset_id = coinData["asset_id"] as? String ?? ""
        name = coinData["name"] as? String ?? ""
        price_usd = coinData["price_usd"] as? Double? ?? 0
    }
    
    static func getCoins(from value: Any) -> [Coin] {
        guard let coinsData = value as? [[String: Any]] else { return [] }

        var coins: [Coin] = []
        
        for coinData in coinsData {
            let coin = Coin(coinData: coinData)
            coins.append(coin)
        }
        
        return coins
    }
}
