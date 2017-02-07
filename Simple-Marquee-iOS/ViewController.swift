//
//  ViewController.swift
//  Simple-Marquee-iOS
//
//  Created by Viraj Padte on 2/6/17.
//  Copyright © 2017 Bit2Labz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var marquee: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func viewDidAppear(_ animated: Bool) {
        //create a duplicate frame
        let newLabelFrame = CGRect(x: self.marquee.frame.minX, y: self.marquee.frame.minY, width: self.marquee.frame.width, height: self.marquee.frame.height)
        let newLabel = UILabel(frame: newLabelFrame)
        newLabel.text = self.marquee.text
        newLabel.center = CGPoint(x: self.view.bounds.width + self.marquee.center.x, y: self.marquee.center.y)
        newLabel.lineBreakMode = NSLineBreakMode.byClipping
        newLabel.textColor = marquee.textColor
        newLabel.alpha = 1
        
        self.view.addSubview(newLabel)
        let orgCenterX = self.marquee.center.x
        UIView.animate(withDuration: 15, delay: 3, options: .repeat, animations: {
            self.marquee.center.x = 0 - self.marquee.center.x
            newLabel.center.x = orgCenterX
        }, completion: nil)
        
        
        
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.white.withAlphaComponent(0.7).cgColor, UIColor.white.withAlphaComponent(0.0).cgColor, UIColor.white.withAlphaComponent(0.0).cgColor,UIColor.white.withAlphaComponent(0.7).cgColor]
        gradient.locations = [0.0,0.1,0.9,1]
        //set gradient direction
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.view.layer.addSublayer(gradient)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

