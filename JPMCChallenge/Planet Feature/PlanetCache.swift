//
//  PlanetCache.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 06/05/2023.
//

import Foundation

public protocol PlanetCache {
    typealias SaveResult = Result<Void, Error>
    typealias LoadResult = Result<[Planet], Error>
    
    func save(_ planets: [Planet], completion: @escaping (SaveResult) -> Void)
    func load(completion: @escaping (LoadResult) -> Void)
}
