//
//  RoutruClient.swift
//  Routru
//
//  Created by YouGotToFindWhatYouLove on 3/23/16.
//  Copyright © 2016 Candy. All rights reserved.
//

import UIKit
import AFNetworking

class RoutruClient: NSObject {
    class var sharedInstance: RoutruClient {
        struct Static {
            static let instance = RoutruClient()
        }
        return Static.instance
    }
    
    var baseUrl = "http://127.0.0.1:8080/searchPlaces?"
   
    var expectedContentLength = 0
    var buffer:NSMutableData = NSMutableData()
    var dataTask:NSURLSessionDataTask?
    var session:NSURLSession?


    
    
    private override init() {}
    
    func fetchBusinesses(queryObject: DestinationQuery?, completion: (businesses: [Business]?)->()) {
        
        let location = queryObject?.location
        let placeType = queryObject?.placeType
        
        let escapedUrl = (baseUrl + "location=\(location!)&query=\(placeType!)").stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        let requestUrl = NSURL(string: escapedUrl!)
        
        // Create the NSURLRequest
        let request = NSURLRequest(URL: requestUrl!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        // Configure session so that completion handler is executed on main UI thread
        session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate: self,
            delegateQueue: NSOperationQueue.mainQueue()
        )
        
        let dataTask = session!.dataTaskWithRequest(request, completionHandler: { (dataOrNil, response, error) in
            if let data = dataOrNil {
                if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                    data, options:[]) as? NSDictionary {
                        var businessesDictionary = responseDictionary["placesList"] as! [NSDictionary]
                        let businesses = Business.businesses(array: businessesDictionary)
                        completion(businesses: businesses)
                }
                    
            }

        })
        dataTask.resume()
        
    }

}

extension RoutruClient: NSURLSessionDelegate, NSURLSessionDataDelegate {
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveResponse response: NSURLResponse, completionHandler: (NSURLSessionResponseDisposition) -> Void) {
        
        //here you can get full lenth of your content
        expectedContentLength = Int(response.expectedContentLength)
        print(expectedContentLength)
        completionHandler(NSURLSessionResponseDisposition.Allow)
    }
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        buffer = NSMutableData()
        
        buffer.appendData(data)
        
        let percentageDownloaded = Float(buffer.length) / Float(expectedContentLength)
        print(percentageDownloaded)
    }
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        //use buffer here.Download is done
        print("hello")
    }

    
}
