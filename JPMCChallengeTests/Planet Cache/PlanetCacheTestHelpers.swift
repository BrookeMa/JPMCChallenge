//
//  PlanetCacheTestHelpers.swift
//  JPMCChallengeTests
//
//  Created by Ye Ma on 04/05/2023.
//

import Foundation
import JPMCChallenge

func uniquePlanet() -> Planet {
    return Planet(name: "any\(UUID())", rotationPeriod: "any", orbitalPeriod: "any", diameter: "any", climate: "any", gravity: "any", terrain: "any", surfaceWater: "any", population: "any", residents: [anyURL()], films: [anyURL()], created: Date(), edited: Date(), url: anyURL())
}



func uniquePlanetItem() -> (models: [Planet], local: [LocalPlanet]) {
    let models = [uniquePlanet(), uniquePlanet()]
    let local = models.map { LocalPlanet(name: $0.name,
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
                                         url: $0.url)}
    return (models, local)
}


