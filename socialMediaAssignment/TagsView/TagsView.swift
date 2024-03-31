//
//  TagsView.swift
//  socialMediaAssignment
//
//  Created by Ashish Jain on 31/03/24.
//

import UIKit

class TagsView: UIView {
    
    
    private let reuseIdentifier = "TagsCollectionViewCell"
    lazy var CollectionView = UICollectionView(frame: self.bounds, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView(){
        
        self.addSubview(CollectionView)
        
        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal // Set the scroll direction to horizontal
        CollectionView.collectionViewLayout = layout
        
        let nibName = UINib(nibName: "TagsCollectionViewCell", bundle: nil)
        
        // Register cell class
        CollectionView.register(nibName, forCellWithReuseIdentifier: reuseIdentifier)
    }
    

}

extension TagsView:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TagsCollectionViewCell
        cell.bgMainView.backgroundColor = .red // Just for testing, you may set cell content here
        return cell
    }
    
    
    
    
    
}
