//
//  HTTPURLResponse+StatusCode.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 29/04/2023.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }
    
    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
