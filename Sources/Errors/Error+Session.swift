//
//  Error+Session.swift
//  SendGrid
//
//  Created by Scott Kawai on 6/10/16.
//  Copyright © 2016 Scott Kawai. All rights reserved.
//

import Foundation

public extension Error {
    
    /**
     
     The `Session` enum contains all the errors thrown when attempting to build an HTTP request.
     
     */
    public enum Session: ErrorType, CustomStringConvertible {
        
        // MARK: - Cases
        //=========================================================================
        
        /// Represents an error where no authentication method was provided.
        case AuthenticationMissing
        
        /// Represents an error where an unsupported authentication method was used.
        case AuthenticationTypeNotAllowed(AnyClass, Authentication)
        
        // MARK: - Properties
        //=========================================================================
        
        /// A description for the error.
        public var description: String {
            switch self {
            case .AuthenticationMissing:
                return "Could not make an HTTP request as there was no `Authentication` configured on `Session`. Please set the `authentication` property before calling `send` on `Session`."
            case .AuthenticationTypeNotAllowed(let obj, let auth):
                return "The `\(obj)` class does not allow authentication with \(auth)s. Please try using another Authentication type."
            }
        }
    }
}