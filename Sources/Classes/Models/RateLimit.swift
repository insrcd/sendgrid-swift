//
//  RateLimit.swift
//  SendGrid
//
//  Created by Scott Kawai on 7/26/16.
//  Copyright © 2016 Scott Kawai. All rights reserved.
//

import Foundation

/**
 
 The `RateLimit` struct abstracts any rate-limit information returned from an `NSURLResponse`.
 
 */
public class RateLimit {
    
    // MARK: - Properties
    //=========================================================================
    /// The number of calls allowed for this resource during the refresh period.
    public let limit: Int
    
    /// The number of calls remaining for this resource during the current refresh period.
    public let remaining: Int
    
    /// The date and time at which the refresh period will reset.
    public let resetDate: NSDate
    
    // MARK: - Initialization
    //=========================================================================
    /**
     
     Initializes the class.
     
     - parameter limit:     The total number of calls allowed in the rate limit period for the endpoint.
     - parameter remaining: The number of calls remaining in the rate limit period.
     - parameter NSDate:    The time at which the rate limit will reset.
     
     */
    public init(limit: Int, remaining: Int, resetDate: NSDate) {
        self.limit = limit
        self.remaining = remaining
        self.resetDate = resetDate
    }
    
    // MARK: - Methods
    //=========================================================================
    /**
     
     Abstracts out the rate-limiting headers from an `NSURLResponse` and stores their value in a new instance of `RateLimit`.
     
     - parameter response:   An instance of `NSURLResponse`.
     
     - returns: An instance of `RateLimit` using information from an NSURLResponse (if rate limit information was returned in the NSURLResponse).
     
     */
    class func rateLimitInfoFromUrlResponse(response: NSURLResponse?) -> RateLimit? {
        guard let http = response as? NSHTTPURLResponse,
            limitStr = http.allHeaderFields["X-RateLimit-Limit"] as? String,
            li = Int(limitStr),
            remainStr = http.allHeaderFields["X-RateLimit-Remaining"] as? String,
            re = Int(remainStr),
            dateStr = http.allHeaderFields["X-RateLimit-Reset"] as? String,
            date = Double(dateStr)
            else { return nil }
        return RateLimit(limit: li, remaining: re, resetDate: NSDate(timeIntervalSince1970: date))
    }
}