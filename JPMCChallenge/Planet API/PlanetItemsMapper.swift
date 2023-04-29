//
//  PlanetItemsMapper.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 29/04/2023.
//

import Foundation

final class PlanetItemsMapper {
    private struct Root: Decodable {
        
        private let items: [RemotePlanetItem]
        private struct RemotePlanetItem: Decodable {
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
        
        var planets: [Planet] {
            return []
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
