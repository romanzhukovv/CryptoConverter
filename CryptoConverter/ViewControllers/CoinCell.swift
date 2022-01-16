//
//  CoinCell.swift
//  CryptoConverter
//
//  Created by Roman Zhukov on 16.01.2022.
//

import UIKit

class CoinCell: UICollectionViewCell {
    @IBOutlet var coinPrice: UILabel!
    @IBOutlet var coinName: UILabel!
    
    func configure(with coin: Coin) {
        coinPrice.text = String(format: "%.2f", coin.price_usd ?? 0) + "$"
        coinName.text = coin.name
    }
}
