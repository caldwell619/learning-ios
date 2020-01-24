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
        // Do any additional setup after loading the view.
        collectionView.backgroundColor = .red
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "Cell")
        navigationItem.title = "Yo Mama"
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

class VideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let thumbnailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        return imageView
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    func setupViews(){
        backgroundColor = .red
        addSubview(thumbnailImage)
        addSubview(dividerView)
        // string is auto layout format. |-[...]-| represents the edges. the number is the space between the edges.
        // the dictionary maps the view to the key inside of the contraint string.
        // H is for height, V is for Vertical
        addFormatConstraints(formatString: "H:|-16-[v0]-16-|", views: thumbnailImage)
        addFormatConstraints(formatString: "V:|-16-[v0]-16-|", views: thumbnailImage)
        addFormatConstraints(formatString: "H:|[v0]|", views: dividerView)
        // parenthesis means height of view in pixels
        // ommitting the left pipe prevents the cell from having the view at the top
        addFormatConstraints(formatString: "V:[v0(1)]|", views: dividerView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    func addFormatConstraints(formatString: String, views: UIView...){
        var viewDictionary = [String: UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            // allows for auto layout
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: formatString, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDictionary))
    }
}

