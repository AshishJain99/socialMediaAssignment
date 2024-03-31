//
//  headerView.swift
//  socialMediaAssignment
//
//  Created by Ashish Jain on 30/03/24.
//

import UIKit

class headerView: UIView {

    lazy var selfHeight = self.frame.height
    
    lazy var backButtonView = UIView(frame: CGRect(x: 0, y: 0, width: selfHeight, height: selfHeight))
    lazy var backImageView = UIImageView(frame: backButtonView.bounds)
    
    lazy var cameraButtonView = UIView(frame: CGRect(x: backButtonView.bounds.maxX, y: 0, width: selfHeight, height: selfHeight))
    lazy var cameraImageView = UIImageView(frame: cameraButtonView.bounds)
    
    lazy var threeDotView = UIView(frame: CGRect(x: self.frame.maxX-selfHeight, y: 0, width: selfHeight, height: selfHeight))
    lazy var threeDotImageView = UIImageView(frame: threeDotView.bounds)
    
    lazy var searchView = UIView(frame: CGRect(x: threeDotView.frame.minX-selfHeight, y: 0, width: selfHeight, height: selfHeight))
    lazy var searchImageView = UIImageView(frame: searchView.bounds)
    
    lazy var nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: selfHeight))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Custom initialization code for coder
        setupView()
    }
    
    func setupView(){
        self.backgroundColor = .red
        
        self.addSubview(cameraButtonView)
        self.addSubview(backButtonView)
        self.addSubview(threeDotView)
        self.addSubview(searchView)
        self.addSubview(nameLabel)
        
        nameLabel.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        
        backButtonView.backgroundColor = .green
        cameraButtonView.backgroundColor = .blue
        threeDotView.backgroundColor = .yellow
        searchView.backgroundColor = .cyan
        
        nameLabel.text = "Ankita"
        nameLabel.textAlignment = .center
        
    }
    
    func setupGesture(){
        let cameraTap = UITapGestureRecognizer(target: self, action: #selector(cameraTapped))
        cameraButtonView.addGestureRecognizer(cameraTap)
    }
    
    
}

extension headerView{
    
    @objc func cameraTapped(){
        print("Camera tapped")
        
    }
    
}
