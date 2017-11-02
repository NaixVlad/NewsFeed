//
//  Result.swift
//  NewsFeed
//
//  Created by Vladislav Andreev on 02.11.2017.
//  Copyright © 2017 Vladislav Andreev. All rights reserved.
//

import Foundation

/// Represents whether a request was successful or encountered an error.
public enum Result<Value> {
    
    /// The request and all post processing operations were successful.
    case success(Value)
    
    /// The request encountered an error resulting in a failure.
    case failure(Error)
    
    /// Returns the associated value if the result is a success, `nil` otherwise.
    public var value: Value? {
        switch self {
        case .success(let value):
            return (value)
        case .failure:
            return nil
        }
    }
    
    /// Returns the associated error value if the result is a failure, `nil` otherwise.
    public var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}

/// Represents errors in interacting with the Dark Sky API.
public enum ModelIOError: Error {
    
    /// Error due to invalid JSON.
    case invalidJSON(Data)
}
