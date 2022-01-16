//
//  Coin.swift
//  CryptoConverter
//
//  Created by Roman Zhukov on 15.01.2022.
//

struct Coin: Decodable {
    let name: String
    let price_usd: Float?
}
