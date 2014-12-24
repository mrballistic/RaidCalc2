//
//  ViewController.swift
//  RAIDCalc
//
//  Created by Todd Greco on 12/15/14.
//  Copyright (c) 2014 mrBallistic. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    //MARK -Outlets and Properties
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myPicker: UIPickerView!
    
    //MARK -Instance Methods
    
    var pickerData = [
        [" "]
    ]
    
    //MARK -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPicker.delegate = self
        myPicker.dataSource = self
        
        DataManager.getJSONFileWithSuccess { (data) -> Void in
            let json = JSON(data: data)
            let drives = json["drives"]
            
            for item in drives {
                
                let thisDrive = item.1.double
                
                let thisText = DataManager.cleanUpDataValue(thisDrive!)
                
                self.pickerData[0].append(thisText)
                
                println(thisText);
                
            }
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK -Delgates and DataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[component][row]
    }
    
    //MARK -Instance Methods
    func updateLabel(){
        let size = pickerData[0][myPicker.selectedRowInComponent(0)]
        let topping = pickerData[1][myPicker.selectedRowInComponent(1)]
        //pizzaLabel.text = "Pizza: " + size + " " + topping
    }
    
    

}

