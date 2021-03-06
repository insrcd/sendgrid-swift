//
//  Setting.swift
//  SendGrid
//
//  Created by Scott Kawai on 5/15/16.
//  Copyright © 2016 Scott Kawai. All rights reserved.
//

import Foundation

/**
 
 The `Setting` class is a base class that is inherited by both the mail setting and tracking setting options. It should not be used directly.
 
 */
public class Setting: DictionaryConvertible {
    
    // MARK: - Properties
    //=========================================================================
    
    /// A bool indicating if the setting should be on or off.
    public let enable: Bool
    
    
    // MARK: - Computed Properties
    //=========================================================================
    
    /// The dictionary representation of the setting.
    public var dictionaryValue: [NSObject : AnyObject] {
        return [
            "enable": NSNumber(bool: self.enable)
        ]
    }
    
    
    // MARK: - Initialization
    //=========================================================================
    /**
     
     Initializes the setting with a boolean indicating if the setting should be on or off.
     
     - parameter enabled:	A bool representing if the setting is enabled or not.
     
     */
    public init(enable: Bool) {
        self.enable = enable
    }
    
}