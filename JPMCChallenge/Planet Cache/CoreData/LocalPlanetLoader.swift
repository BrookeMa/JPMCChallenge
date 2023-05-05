//
//  LocalPlanetLoader.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 05/05/2023.
//

import Foundation

public final class LocalPlanetLoader {
    private let store: PlanetStore
    private let currentDate: () -> Date
    
    public init(store: PlanetStore, currentDate: @escaping () -> Date) {
        self.store = store
        self.currentDate = currentDate
    }
}

extension LocalPlanetLoader {
    public typealias SaveResult = Result<Void, Error>
    
    public func save(_ articles: [Planet], completion: @escaping (SaveResult) -> Void) {
        store.deleteCachedPlanet { [weak self] deletionResult in
            guard let self = self else { return }
            
            switch deletionResult {
            case .success:
                self.cache(articles, with: completion)
                
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    private func cache(_ articles: [Planet], with completion: @escaping (SaveResult) -> Void) {
        store.insert(articles.toLocal(), timestamp: currentDate()) { [weak self] InsertionResult in
            guard self != nil else { return }
            
            completion(InsertionResult)
        }
    }
}

private extension Array where Element == LocalPlanet {
    func toModels() -> [Planet] {
        return map { Planet(name: $0.name,
                            rotationPeriod: $0.rotationPeriod,
                            orbitalPeriod: $0.orbitalPeriod,
                            diameter: $0.diameter,
                            climate: $0.climate,
                            gravity: $0.gravity,
                            terrain: $0.terrain,
                            surfaceWater: $0.surfaceWater,
                            population: $0.population,
                            residents: $0.residents,
                            films: $0.films,
                            created: $0.created,
                            edited: $0.edited,
                            url: $0.url) }
    }
}

private extension Array where Element == Planet {
    func toLocal() -> [LocalPlanet] {
        return map { LocalPlanet(name: $0.name,
                                rotationPeriod: $0.rotationPeriod,
                                orbitalPeriod: $0.orbitalPeriod,
                                diameter: $0.diameter,
                                climate: $0.climate,
                                gravity: $0.gravity,
                                terrain: $0.terrain,
                                surfaceWater: $0.surfaceWater,
                                population: $0.population,
                                residents: $0.residents,
                                films: $0.films,
                                created: $0.created,
                                edited: $0.edited,
                                url: $0.url) }
    }
}
