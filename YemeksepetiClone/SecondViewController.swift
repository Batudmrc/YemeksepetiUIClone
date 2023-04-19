//
//  SecondViewController.swift
//  YemeksepetiClone
//
//  Created by Batuhan Demircioğlu on 18.04.2023.
//

import UIKit

class SecondViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var offersCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var offers: [Offer] = [Offer(image: "offer1"),Offer(image: "offer2"),Offer(image: "offer3"),Offer(image: "offer4"),Offer(image: "offer5"),Offer(image: "offer6"),Offer(image: "offer2"),Offer(image: "offer1"),Offer(image: "offer2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        offersCollectionView.showsHorizontalScrollIndicator = false
        
        offersCollectionView.dataSource = self
        offersCollectionView.delegate = self
        
        setupSearchBar()
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
        
        offersCollectionView.register(UINib(nibName: OffersCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: OffersCollectionViewCell.identifier)
        
        
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
        return offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OffersCollectionViewCell.identifier, for: indexPath) as! OffersCollectionViewCell
        cell.setup(offer: offers[indexPath.row])
        return cell
    }
    
    
}
