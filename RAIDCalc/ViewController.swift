//
//  ViewController.swift
//  RAIDCalc
//
//  Created by Todd Greco on 12/15/14.
//  Copyright (c) 2014 mrBallistic. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        DataManager.getJSONFileWithSuccess { (data) -> Void in
            // Get #1 app name using SwiftyJSON
            let json = JSON(data: data)
            let drives = json["drives"]

            
            for item in drives {

                
                let thisDrive = item.1.double

                
                println(DataManager.cleanUpDataValue(thisDrive!))
                
                
                
            }
            
            
          
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

