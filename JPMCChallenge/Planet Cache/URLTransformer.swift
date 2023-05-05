//
//  URLTransformer.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 05/05/2023.
//

import Foundation

class URLTransformer: NSSecureUnarchiveFromDataTransformer {
    // Override the allowed classes property to return an array of types you want to allow decoding.
    override class var allowedTopLevelClasses: [AnyClass] {
        return super.allowedTopLevelClasses + [NSURL.self]
    }

    // Register the transformer with a name to use it in the Core Data model.
    public static let name = NSValueTransformerName(rawValue: String(describing: URLTransformer.self))

    public override class func allowsReverseTransformation() -> Bool {
        return true
    }
}
