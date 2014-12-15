//
//  DataManager.swift
//  RAIDCalc
//
//  Created by Todd Greco on 12/15/14.
//  Copyright (c) 2014 mrBallistic. All rights reserved.
//

import Foundation

class DataManager {
    
    
    class func cleanUpDataValue(data:Double) -> String{
        
        var reducedData = data
        var trailingLabel = " GB"
        var returnValue = String()
        
        // we're storing things in megabytes, but really only care about giga- and tera-
        if(data > 999999){
             reducedData = data / 1000000
             trailingLabel = " TB"
        } else {
             reducedData = data / 1000
        }
        
        // convert it to a string for manipulation
        let dataAsString = String(format:"%f", reducedData)
        let significant = dataAsString.componentsSeparatedByString(".")
        
        var sigString = String(0)
        var significantTest = significant[1].toInt()
        
        // check to see if it's, say, 73.4 gb rather than 80.0
        if(significantTest > 0){
            significantTest = significantTest! / 100000
            sigString = String(significantTest!);
            returnValue = significant[0] + "." + sigString + trailingLabel
        } else {
            returnValue = significant[0] + trailingLabel
        }
        
        return returnValue
    }
    

    class func getJSONFileWithSuccess(success: ((data: NSData) -> Void)) {
        //1
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            //2
            let filePath = NSBundle.mainBundle().pathForResource("data",ofType:"json")
            
            var readError:NSError?
            if let data = NSData(contentsOfFile:filePath!,
                options: NSDataReadingOptions.DataReadingUncached,
                error:&readError) {
                    success(data: data)
            }
        })
    }
    
    

}
