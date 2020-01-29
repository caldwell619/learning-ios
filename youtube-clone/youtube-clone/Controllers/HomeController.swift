//
//  ViewController.swift
//  youtube-clone
//
//  Created by Christopher Caldwell on 1/21/20.
//  Copyright © 2020 Christopher Caldwell. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "Cell")
        let titleLabel = UILabel(frame: CGRect( x: 0, y: 0, width: view.frame.height - 32, height: view.frame.height))
        titleLabel.text = "Yo Mama"
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.isTranslucent = false
        setupMenuBar()
        
    }
    
    let menuBar: MenuBar = {
        let localMenuBar = MenuBar()
        return localMenuBar
    }()
    
    private func setupMenuBar(){
        edgesForExtendedLayout = []
        view.addSubview(menuBar)
        view.addFormatConstraints(formatString: "H:|[v0]|", views: menuBar)
        view.addFormatConstraints(formatString: "V:|[v0(50)]", views: menuBar)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // determine height maintaining 16x9 ratio
        let height = (view.frame.width - 32) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 68)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
