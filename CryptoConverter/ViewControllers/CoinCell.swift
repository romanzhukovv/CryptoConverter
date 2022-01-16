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
    @IBOutlet var coinIcon: UIImageView!
    
    func configure(with coin: Coin, and icons: [Icon]) {
        coinPrice.text = String(format: "%.2f", coin.price_usd ?? 0) + "$"
        coinName.text = coin.name
        
        DispatchQueue.global().async {
            guard let iconUrl = URL(string: icons.filter({ icon in
                icon.asset_id == coin.asset_id }).first?.url ?? "") else { return }
            guard let imageData = try? Data(contentsOf: iconUrl) else { return }
            
            DispatchQueue.main.async {
                self.coinIcon.image = UIImage(data: imageData)
            }
        }
    }
}
