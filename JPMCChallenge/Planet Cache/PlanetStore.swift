//
//  PlanetStore.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 04/05/2023.
//

import Foundation

public typealias CachedPlanet = (planets: [LocalPlanet], timestamp: Date)

public protocol PlanetStore {
    typealias DeletionResult = Result<Void, Error>
    typealias DeletionCompletion = (DeletionResult) -> Void
    
    typealias InsertionResult = Result<Void, Error>
    typealias InsertionCompletion = (InsertionResult) -> Void
    
    typealias RetrievalResult = Result<CachedPlanet?, Error>
    typealias RetrievalCompletion = (RetrievalResult) -> Void

    func deleteCachedPlanet(completion: @escaping DeletionCompletion)
    func insert(_ planets: [LocalPlanet], timestamp: Date, completion: @escaping InsertionCompletion)
    func retrieve(completion: @escaping RetrievalCompletion)
}
