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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.backgroundColor = .white
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
        // determine height maintaining 16x9 ratio
        let height = (view.frame.width - 32) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 68)
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
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tie-interceptor")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let profileAvatarView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "empire-logo")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCompatibility.systemGray4
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Soontir Fel"
        return label
    }()
    
    let subTitleTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainerInset = UIEdgeInsets.init(top: 0, left: -4, bottom: 0, right: 0)
        textView.textColor = .gray
        textView.text = "Tie Interceptor"
        return textView
    }()
     
    
    func setupViews(){
        backgroundColor = ColorCompatibility.systemBackground
        addSubview(thumbnailImageView)
        addSubview(dividerView)
        addSubview(profileAvatarView)
        addSubview(titleLabel)
        addSubview(subTitleTextView)
        
        
        // string is auto layout format. |-[...]-| represents the edges. the number is the space between the edges.
        // the dictionary maps the view to the key inside of the contraint string.
        // H is for horizontal, V is for Vertical
        // parenthesis means height of view in pixels
        // ommitting the left pipe prevents the cell from having the view at the top
        addFormatConstraints(formatString: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addFormatConstraints(formatString: "V:|-16-[v0]-8-[v1(45)]-16-[v2(1)]|", views: thumbnailImageView, profileAvatarView, dividerView)
        addFormatConstraints(formatString: "H:|[v0]|", views: dividerView)
        addFormatConstraints(formatString: "H:|-16-[v0(45)]", views: profileAvatarView)
        addFormatConstraints(formatString: "V:[v0(20)]", views: titleLabel)
        addFormatConstraints(formatString: "V:[v0(30)]", views: subTitleTextView)
//        addFormatConstraints(formatString: "H:[v0]-16-|", views: titleLabel)
        
        
        // top constaraint - bind the top of the title label to the bottom of the thumbnail, with a padding of 8px
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: profileAvatarView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        // subtitle constraints
        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .left, relatedBy: .equal, toItem: profileAvatarView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
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

