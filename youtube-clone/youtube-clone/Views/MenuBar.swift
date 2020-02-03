//
//  MenuBar.swift
//  youtube-clone
//
//  Created by Chris Caldwell on 1/28/20.
//  Copyright © 2020 Christopher Caldwell. All rights reserved.
//

import UIKit
import ColorCompatibility

class MenuBar: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let cellId = "cellId"
    let namesOfMenuCellImages = ["home-icon", "trending-icon", "subscription-icon", "person-icon"]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        cv.backgroundColor = ColorCompatibility.systemGray2
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        
        // selects the 1st index cell by default
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: .bottom)
        setupHorizontalBar()
    }
    
    let horizontalBarView: UIView = {
        let localHorizontalBarView = UIView()
        localHorizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        localHorizontalBarView.backgroundColor = ColorCompatibility.label
        return localHorizontalBarView
    }()
    
    var horizontalBarLeftAnchor: NSLayoutConstraint?
    
    func setupHorizontalBar(){
        addSubview(horizontalBarView)
        // setting anchor contraints to itself
        
        // setting the left anchor of the horizontal bar to the left anchor of the menu bar
        horizontalBarLeftAnchor = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        
        horizontalBarLeftAnchor?.isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        // setting the width of the bar to equal the menu bar width, multipled by 1/4
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        
        // 4 px
        horizontalBarView.heightAnchor.constraint(equalToConstant: 4 ).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let xPositionOfMenuBar = CGFloat(indexPath.item) * frame.width / 4
        horizontalBarLeftAnchor?.constant = xPositionOfMenuBar
        UIView.animate(withDuration: 0.45, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
    func setupCollectionView(){
        addSubview(collectionView)
        addFormatConstraints(formatString: "H:|[v0]|", views: collectionView)
        addFormatConstraints(formatString: "V:|[v0]|", views: collectionView)
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // downcasting the cell to conform to MenuCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        // capturing the index of the iterated cells, and using it as the key to image
        let nameOfIndexAtIndexPath = namesOfMenuCellImages[indexPath.item]
        let icon = UIImage(named: nameOfIndexAtIndexPath)?.withRenderingMode(
            UIImage.RenderingMode.alwaysTemplate)
        cell.iconView.image = icon
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = frame.height
        let width = frame.width / 4
        return CGSize(width: width, height: height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
