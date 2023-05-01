//
//  PlanetItemsMapper.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 29/04/2023.
//

import Foundation

public final class PlanetItemsMapper {
    private struct Root: Decodable {
        public let count: Int
        public let next: String?
        public let prev: String?
        
        private let results: [RemotePlanetItem]
        
        private struct RemotePlanetItem: Decodable {
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
            let created: String
            let edited: String
            let url: URL
            
            enum CodingKeys: String, CodingKey {
                case name
                case rotationPeriod = "rotation_period"
                case orbitalPeriod = "orbital_period"
                case diameter
                case climate
                case gravity
                case terrain
                case surfaceWater = "surface_water"
                case population
                case residents
                case films
                case created
                case edited
                case url
            }
        }
        
        var planets: [Planet] {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
            return results.map { Planet(name: $0.name,
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
                                        created: dateFormatter.date(from: $0.created)!,
                                        edited: dateFormatter.date(from: $0.edited)!,
                                        url: $0.url) }
        }
    }
    
    public enum Error: Swift.Error {
        case invalidData
    }
    
    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> [Planet] {
        guard response.isOK, let root = try? JSONDecoder().decode(Root.self, from: data) else {
            throw Error.invalidData
        }
        
        return root.planets
    }
}
