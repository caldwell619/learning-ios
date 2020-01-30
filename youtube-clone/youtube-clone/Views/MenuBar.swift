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
