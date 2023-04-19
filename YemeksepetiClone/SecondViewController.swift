//
//  SecondViewController.swift
//  YemeksepetiClone
//
//  Created by Batuhan Demircioğlu on 18.04.2023.
//

import UIKit

class SecondViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var allRestaurantsCollectionView: UICollectionView!
    @IBOutlet weak var offersCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    
    var offers: [Offer] = [Offer(image: "offer1"),Offer(image: "offer2"),Offer(image: "offer3"),Offer(image: "offer4"),Offer(image: "offer5"),Offer(image: "offer6"),Offer(image: "offer2"),Offer(image: "offer1"),Offer(image: "offer2")]
    
    
    var restaurants: [Restaurant] = [Restaurant(title: "Urfalı Hacıoğlu İbrahim Halil Yaşar", category: "Kebap & Türk Mutfağı, Restoran Teslimatlı", servicePrice: "50,00 TL min. sepet tutarı -", image: "rest1"),Restaurant(title: "Urfalı Hacıoğlu İbrahim Halil Yaşar", category: "Kebap & Türk Mutfağı, Restoran Teslimatlı", servicePrice: "50,00 TL min. sepet tutarı -", image: "rest1"),Restaurant(title: "Urfalı Hacıoğlu İbrahim Halil Yaşar", category: "Kebap & Türk Mutfağı, Restoran Teslimatlı", servicePrice: "50,00 TL min. sepet tutarı -", image: "rest1"),Restaurant(title: "Urfalı Hacıoğlu İbrahim Halil Yaşar", category: "Kebap & Türk Mutfağı, Restoran Teslimatlı", servicePrice: "50,00 TL min. sepet tutarı -", image: "rest1"),Restaurant(title: "Urfalı Hacıoğlu İbrahim Halil Yaşar", category: "Kebap & Türk Mutfağı, Restoran Teslimatlı", servicePrice: "50,00 TL min. sepet tutarı -", image: "rest1"),Restaurant(title: "Urfalı Hacıoğlu İbrahim Halil Yaşar", category: "Kebap & Türk Mutfağı, Restoran Teslimatlı", servicePrice: "50,00 TL min. sepet tutarı -", image: "rest1"),Restaurant(title: "Urfalı Hacıoğlu İbrahim Halil Yaşar", category: "Kebap & Türk Mutfağı, Restoran Teslimatlı", servicePrice: "50,00 TL min. sepet tutarı -", image: "rest1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

        // Disable scrolling on the collection view

        // Calculate the height of the collection view based on the cell content size
        let collectionViewHeight = allRestaurantsCollectionView.collectionViewLayout.collectionViewContentSize.height

        // Set the height of the view containing the collection view to match the height of the collection view
        contentView.frame.size.height = collectionViewHeight

        // Calculate the combined height of the view containing the collection view and any other components above it
        let combinedHeight = contentView.frame.origin.y + contentView.frame.size.height

        // Set the height of the content view to match the combined height
        contentView.frame.size.height = combinedHeight

        // Set the content size of the scroll view to fit the height of the content view
        scrollView.contentSize = contentView.frame.size


        
        offersCollectionView.showsHorizontalScrollIndicator = false
        offersCollectionView.dataSource = self
        offersCollectionView.delegate = self
        
        allRestaurantsCollectionView.showsHorizontalScrollIndicator = false
        allRestaurantsCollectionView.dataSource = self
        allRestaurantsCollectionView.delegate = self
        
        setupSearchBar()
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
        
        offersCollectionView.register(UINib(nibName: OffersCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: OffersCollectionViewCell.identifier)
        allRestaurantsCollectionView.register(UINib(nibName: AllRestaurantsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: AllRestaurantsCollectionViewCell.identifier)
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func setupSearchBar() {
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
    }
}

extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case offersCollectionView:
            return offers.count
        case allRestaurantsCollectionView:
            return restaurants.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch collectionView {
        case offersCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OffersCollectionViewCell.identifier, for: indexPath) as! OffersCollectionViewCell
            cell.setup(offer: offers[indexPath.row])
            return cell
        case allRestaurantsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllRestaurantsCollectionViewCell.identifier, for: indexPath) as! AllRestaurantsCollectionViewCell
            cell.setup(restaurant: restaurants[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        
        
    }
    
    
}


}
