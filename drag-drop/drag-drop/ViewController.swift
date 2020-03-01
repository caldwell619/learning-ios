//
//  ViewController.swift
//  drag-drop
//
//  Created by Chris Caldwell on 3/1/20.
//  Copyright © 2020 Chris Caldwell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIDropInteractionDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .blue
        // adding the interactivity to the view
        view.addInteraction(UIDropInteraction(delegate: self))
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        for dragItem in session.items {
            dragItem.itemProvider.loadObject(ofClass: UIImage.self) { (object, error) in
                // js callback style
                if let error = error {
                    print("Error loading image", error)
                    return
                }
                // casts the draggable image to a UIImage, if it fails, return
                guard let draggableImage = object as? UIImage else { return }
                // previou operation was on the background thread, implicityly saying you're performing
                // the following operation on the main thread is necessary
                DispatchQueue.main.async {
                    let imageView = UIImageView(image: draggableImage)
                    // self needed because scope is set to inside the function
                    self.view.addSubview(imageView)
                    imageView.frame = CGRect(x: 0, y: 0, width: draggableImage.size.width, height: draggableImage.size.height)
                    let pointOfDrop = session.location(in: self.view)
                    imageView.center = pointOfDrop
                }
                
            }
        }
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: UIImage.self)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    

}

