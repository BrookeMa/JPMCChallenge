//
//  PlanetLoader.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 30/04/2023.
//

import Foundation

public protocol PlanetLoader {
    typealias Result = Swift.Result<[Planet], Error>
    
    func load(completion: @escaping (Result) -> Void)
}
