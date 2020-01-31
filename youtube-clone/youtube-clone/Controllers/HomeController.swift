//
//  ViewController.swift
//  youtube-clone
//
//  Created by Christopher Caldwell on 1/21/20.
//  Copyright © 2020 Christopher Caldwell. All rights reserved.
//

import UIKit
import ColorCompatibility

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    
    var videos: [Video] = {
        let firstVideo = Video(thumbnailImageName: "tie-interceptor", avatarImageName: "tie-interceptor", titleOfVideo: "Soontir Fel", subTitleOfVideo: "TIE Interceptor")
        let secondVideo = Video(thumbnailImageName: "tie-defender", avatarImageName: "tie-interceptor", titleOfVideo: "Countess Ryad", subTitleOfVideo: "TIE Defender")
        return [firstVideo, secondVideo]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = ColorCompatibility.systemBackground
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "Cell")
        // starts CollectionView below the menu bar
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        // starts scroll indicator below the menu bar
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        let titleLabel = UILabel(frame: CGRect( x: 0, y: 0, width: view.frame.height - 32, height: view.frame.height))
        titleLabel.text = "Yo Mama"
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.isTranslucent = false
        setupMenuBar()
        setupNavBar()
        
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
    
    func createUIBarButtonItem(nameOfImage: String, handler: Selector) -> UIBarButtonItem {
        let icon = UIImage(named: nameOfImage)?.withRenderingMode(
        UIImage.RenderingMode.alwaysTemplate)
        
        let mvButtonItem = UIBarButtonItem(image: icon, style: .plain, target: self, action: handler)
        mvButtonItem.tintColor = .white
        return mvButtonItem
    }
    
    @objc func handleMore(){
        print("more tapped")
    }
    
    @objc func handleSearch(){
        print("seach tapped")
    }
    
    private func setupNavBar(){
        let moreVerticalButtonItem = createUIBarButtonItem(nameOfImage: "more-vert-icon", handler: #selector(handleMore))
        let searchButtonItem = createUIBarButtonItem(nameOfImage: "search-icon", handler: #selector(handleSearch))
        navigationItem.rightBarButtonItems = [moreVerticalButtonItem, searchButtonItem]
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! VideoCell
        
        cell.video = videos[indexPath.item]
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
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
