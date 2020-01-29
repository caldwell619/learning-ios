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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
