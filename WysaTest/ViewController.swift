//
//  ViewController.swift
//  WysaTest
//
//  Created by Akash Sheokand on 10/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!//panda UI Image View used for demonstrating pan gesture
    var center:CGPoint = CGPoint()//variable for storing the original center(coordinates) of the UI Image View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initializing Pan Gesture Recognizer
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(sender:)))
        // Attach it to a UI Image View
        image.isUserInteractionEnabled = true //enable user interaction, as user interaction not enabled by default in UI Image View
        image.addGestureRecognizer(panGestureRecognizer)
        center = image.center // record the original center of the image to be used further in the program.
    }

    
    //Selector for Pan Gesture Recognizer
    @objc func didPan(sender: UIPanGestureRecognizer) {
       let translation = sender.translation(in: view)//Delta coordinates
       if sender.state == .began {
        print("Pan Gesture began")
       } else if sender.state == .changed {
        // Add the Delta coordinates to original coordinates to achieve the pan gesture
        print("coordinates are changing ",translation.x,translation.y)
        self.image.center = CGPoint(x: self.center.x+translation.x, y: self.center.y + translation.y)// update the coordinates of the UI Image View
       } else if sender.state == .ended {
        print("Pan Gesture ended")
        //Use the original coordinates to reset the UI Image view to original position.
        self.image.center = self.center
       }
    }
    
}

