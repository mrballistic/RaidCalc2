//
//  DataManager.swift
//  RAIDCalc
//
//  Created by Todd Greco on 12/15/14.
//  Copyright (c) 2014 mrBallistic. All rights reserved.
//

import Foundation

class DataManager {

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
