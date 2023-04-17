//
//  ViewController.swift
//  YemeksepetiClone
//
//  Created by Batuhan Demircioğlu on 16.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var restaurants: [Restaurant] = [Restaurant(title: "Köfteci Yusuf", category: "Köfte, Kebap & Türk Mutfağı", servicePrice: "0 TL Gönderim Ücreti", image: "yusuflast"),Restaurant(title: "Köfteci Yusuf", category: "Köfte, Kebap & Türk Mutfağı", servicePrice: "0 TL Gönderim Ücreti", image: "yusuflast"),Restaurant(title: "Köfteci Yusuf", category: "Köfte, Kebap & Türk Mutfağı", servicePrice: "0 TL Gönderim Ücreti", image: "yusuflast")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.showsHorizontalScrollIndicator = false
        
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.layer.cornerRadius = 15
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.searchTextField.leftView?.tintColor = .lightGray
        searchBar.searchTextField.placeholder = "Restoran veya market arayın"
        
        let placeholder = "Restoran veya market arayın"
        let font = UIFont.systemFont(ofSize: 14) // set the desired font size here
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font]
        let attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        searchBar.searchTextField.attributedPlaceholder = attributedPlaceholder
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        let searchIconView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        searchIconView.tintColor = .lightGray
        searchIconView.contentMode = .scaleAspectFit
        searchIconView.frame = CGRect(x: 10, y: 0, width: 20, height: 20) // add left padding of 10 points
        paddingView.addSubview(searchIconView)
        searchBar.searchTextField.leftView = paddingView
        searchBar.searchTextField.leftViewMode = .always

        
        collectionView.register(UINib(nibName: PastOrdersCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PastOrdersCollectionViewCell.identifier)
        // Do any additional setup after loading the view.
    }


}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PastOrdersCollectionViewCell.identifier, for: indexPath) as! PastOrdersCollectionViewCell
        cell.setup(restaurant: restaurants[indexPath.row])
        return cell
    }
    
    
}

