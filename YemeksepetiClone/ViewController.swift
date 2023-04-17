//
//  ViewController.swift
//  YemeksepetiClone
//
//  Created by Batuhan Demircioğlu on 16.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!

    @IBOutlet weak var pastCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var restaurants: [Restaurant] = [Restaurant(title: "Köfteci Yusuf", category: "Köfte, Kebap & Türk Mutfağı", servicePrice: "0 TL Gönderim Ücreti", image: "yusuflast"),Restaurant(title: "Köfteci Yusuf", category: "Köfte, Kebap & Türk Mutfağı", servicePrice: "0 TL Gönderim Ücreti", image: "yusuflast"),Restaurant(title: "Köfteci Yusuf", category: "Köfte, Kebap & Türk Mutfağı", servicePrice: "0 TL Gönderim Ücreti", image: "yusuflast")]
    
    var categories: [Category] = [Category(label: "Burger", image: "Gelal"),Category(label: "Döner", image: "Gelal"),Category(label: "Pizza", image: "Gelal"),Category(label: "Pilav", image: "Gelal"),Category(label: "Köfte", image: "Gelal"),Category(label: "Çiğ Köfte", image: "Gelal"),Category(label: "Kebap & Türk Mutfağı", image: "Gelal")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pastCollectionView.showsHorizontalScrollIndicator = false
        
        pastCollectionView.dataSource = self
        pastCollectionView.delegate = self
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
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

        
        pastCollectionView.register(UINib(nibName: PastOrdersCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PastOrdersCollectionViewCell.identifier)
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        // Do any additional setup after loading the view.
    }


}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case pastCollectionView:
            return restaurants.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case pastCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PastOrdersCollectionViewCell.identifier, for: indexPath) as! PastOrdersCollectionViewCell
            cell.setup(restaurant: restaurants[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
        
        
    }
    
    
}

