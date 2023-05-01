//
//  Planet.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 29/04/2023.
//

import Foundation

public struct Planet: Equatable {
    let name: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surfaceWater: String
    let population: String
    let residents: [URL]
    let films: [URL]
    let created: Date
    let edited: Date
    let url: URL
    
    public init(name: String,
                     rotationPeriod: String,
                     orbitalPeriod: String,
                     diameter: String,
                     climate: String,
                     gravity: String,
                     terrain: String,
                     surfaceWater: String,
                     population: String,
                     residents: [URL],
                     films: [URL],
                     created: Date,
                     edited: Date,
                     url: URL) {
                    self.name = name
                    self.rotationPeriod = rotationPeriod
                    self.orbitalPeriod = orbitalPeriod
                    self.diameter = diameter
                    self.climate = climate
                    self.gravity = gravity
                    self.terrain = terrain
                    self.surfaceWater = surfaceWater
                    self.population = population
                    self.residents = residents
                    self.films = films
                    self.created = created
                    self.edited = edited
                    self.url = url
                }
}
