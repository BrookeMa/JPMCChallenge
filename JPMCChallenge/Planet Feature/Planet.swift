//
//  Planet.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 29/04/2023.
//

import Foundation

public struct Planet: Equatable {
    let name: String
    let rotationPeriod: Int?
    let orbitalPeriod: Int?
    let diameter: Int?
    let climate: Int?
    let gravity: Int?
    let terrain: Int?
    let surfaceWater: String?
    let population: String?
    let residents: [URL]
    let films: [URL]
    let created: String
    let edited: String
    let url: URL
}
