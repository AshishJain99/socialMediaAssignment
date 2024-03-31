//
//  storiesView.swift
//  socialMediaAssignment
//
//  Created by Ashish Jain on 30/03/24.
//

import UIKit

class StoriesView: UIView {
    
    private let reuseIdentifier = "StoriesCollectionViewCell"
    lazy var storiesCollectionView = UICollectionView(frame: self.bounds, collectionViewLayout: UICollectionViewFlowLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        // Set up collection view layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal // Set the scroll direction to horizontal
        storiesCollectionView.collectionViewLayout = layout
        
        
        let nibName = UINib(nibName: "StoriesCollectionViewCell", bundle: nil)
        
        // Register cell class
        storiesCollectionView.register(nibName, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Set delegate and data source
        storiesCollectionView.delegate = self
        storiesCollectionView.dataSource = self
        
        // Add collection view to the view hierarchy
        addSubview(storiesCollectionView)
    }
}

extension StoriesView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! StoriesCollectionViewCell
        cell.backgroundColor = .red // Just for testing, you may set cell content here
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Return the size of each item
        return CGSize(width: collectionView.bounds.height, height: collectionView.bounds.height) // Example: fixed width, full height
    }
}

//class StoriesCollectionViewCell: UICollectionViewCell {
//    // Add any custom UI elements or configurations for your cell
//}
