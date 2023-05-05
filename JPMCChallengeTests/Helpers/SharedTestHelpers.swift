//
//  SharedTestHelpers.swift
//  JPMCChallengeTests
//
//  Created by Ye Ma on 29/04/2023.
//

import Foundation
import JPMCChallenge

func uniquePlanets() -> [LocalPlanet] {
    [uniquePlanet(), uniquePlanet()]
}

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func anyData() -> Data {
    return Data("any data".utf8)
}

func makeItemsJSON(_ items: [[String: Any]], count: Int = 0, next: String? = nil, previous: String? = nil) -> Data {
    let json: [String : Any] = ["results": items,
                                "count": count,
                                "next": next ?? NSNull(),
                                "previous": previous ?? NSNull()]
    return try! JSONSerialization.data(withJSONObject: json)
}

extension HTTPURLResponse {
    convenience init(statusCode: Int) {
        self.init(url: anyURL(), statusCode: statusCode, httpVersion: nil, headerFields: nil)!
    }
}
