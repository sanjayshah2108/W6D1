//
//  GesturesViewController.swift
//  Gestures&Animations
//
//  Created by Sanjay Shah on 2018-08-06.
//  Copyright © 2018 Sanjay Shah. All rights reserved.
//

import UIKit

class GesturesViewController: UIViewController {
    
    @IBOutlet var myTapGR: UITapGestureRecognizer!
    

    @IBOutlet weak var redView: UIView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

        //can either add a selector method to our outlet
        //myTapGR.addTarget(self, action: #selector(manuallyDetectTap))
    }

    @objc func manuallyDetectTap(sender: UITapGestureRecognizer){
        
            print(sender.location(in: redView))
        
    }
    
    
    //or add an IBAction
    @IBAction func myTapGRAction(_ sender: Any) {
        
        //conditionally casting here because my parameter is of type 'Any'
        //only when we know its a TapGR, can we use its location and other properties
        if let sender = sender as? UITapGestureRecognizer {
            
            print(sender.location(in: redView))
        }
    }
    
    
    @IBAction func myRotationGRAction(_ sender: UIRotationGestureRecognizer) {
    
        //here no need to cast as the parameter is already a UIRotationGR
            print(sender.velocity)
  
    }
    


}
