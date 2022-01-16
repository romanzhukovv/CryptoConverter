//
//  CoinCollectionViewController.swift
//  CryptoConverter
//
//  Created by Roman Zhukov on 16.01.2022.
//

import UIKit



class CoinsCollectionViewController: UICollectionViewController {
    private var coins: [Coin] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.fetchCoin { coins in
            self.coins = coins
            self.coins.sort { $0.price_usd ?? 0 > $1.price_usd ?? 0}
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        coins.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "coin", for: indexPath) as! CoinCell
        
        let coin = coins[indexPath.item]
        cell.configure(with: coin)
        return cell
    }
}

extension CoinsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 40, height: 70)
    }
}
