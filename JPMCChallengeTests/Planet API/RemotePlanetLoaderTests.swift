//
//  RemotePlanetLoaderTests.swift
//  JPMCChallengeTests
//
//  Created by Ye Ma on 30/04/2023.
//

import XCTest
import JPMCChallenge

class RemotePlanetLoaderTests: XCTestCase {
    
    func test_map_throwsErrorOnNon200HTTPResponse() throws {
        let json = makeItemsJSON([])
        let samples = [199, 201, 300, 400, 500]
        
        try samples.forEach { code in
            XCTAssertThrowsError(
                try PlanetItemsMapper.map(json, from: HTTPURLResponse(statusCode: code))
            )
        }
    }
    
    func test_map_throwsErrorOn200HTTPResponseWithInvalidJSON() {
        let invalidJSON = Data("invalid json".utf8)
        
        XCTAssertThrowsError(
            try PlanetItemsMapper.map(invalidJSON, from: HTTPURLResponse(statusCode: 200))
        )
    }
    
    func test_map_deliversNoItemsOn200HTTPResponseWithEmptyJSONList() throws {
        let emptyListJSON = makeItemsJSON([])
        
        let result = try PlanetItemsMapper.map(emptyListJSON, from: HTTPURLResponse(statusCode: 200))
        
        XCTAssertEqual(result, [])
    }
    
    func test_map_deliversItemsOn200HTTPResponseWithJSONItems() throws {
        
        let json = makeItemsJSON([tatooineItem.json, alderaanItem.json, mygeetoItem.json, stewjonItem.json, unknownPlanetItem.json], count: 5)
        let result = try PlanetItemsMapper.map(json, from: HTTPURLResponse(statusCode: 200))
        
        XCTAssertEqual(result, [tatooineItem.model, alderaanItem.model, mygeetoItem.model, stewjonItem.model, unknownPlanetItem.model])
    }
    
    // MARK: - Helpers
    
    private func makeItem(name: String,
                          rotationPeriod: String,
                          orbitalPeriod: String,
                          diameter: String,
                          climate: String,
                          gravity: String,
                          terrain: String,
                          surfaceWater: String,
                          population: String,
                          residents: [URL] = [],
                          films: [URL] = [],
                          created: Date,
                          edited: Date,
                          url: URL) -> (model: Planet, json: [String: Any]) {
        
        let item = Planet(name: name,
                        rotationPeriod: rotationPeriod,
                        orbitalPeriod: orbitalPeriod,
                        diameter: diameter,
                        climate: climate,
                        gravity: gravity,
                        terrain: terrain,
                        surfaceWater: surfaceWater,
                        population: population,
                        residents: residents,
                        films: films,
                        created: created,
                        edited: edited,
                        url: url)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
        
        let json = [
            "name": name,
            "rotation_period": rotationPeriod,
            "orbital_period": orbitalPeriod,
            "diameter": diameter,
            "climate": climate,
            "gravity": gravity,
            "terrain": terrain,
            "surface_water": surfaceWater,
            "population": population,
            "residents": residents.map { $0.absoluteString },
            "films": films.map { $0.absoluteString },
            "created": dateFormatter.string(from: created),
            "edited": dateFormatter.string(from: edited),
            "url": url.absoluteString,
        ].compactMapValues { $0 }
        
        return (item, json)
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
        return dateFormatter
    } ()
    
    private var tatooineItem: (model: Planet, json: [String: Any]) {
        let created = dateFormatter.date(from: "2014-12-09T13:50:51.644000Z")!
        let edited = dateFormatter.date(from: "2014-12-20T21:17:56.891000Z")!
        let residents: [URL] = [URL(string: "https://swapi.dev/api/people/1/")!]
        let films: [URL] = [URL(string: "https://swapi.dev/api/films/1/")!]
        let url = URL(string: "https://swapi.dev/api/planets/1/")!

        
       return makeItem(name: "Tatooine",
                         rotationPeriod: "23",
                         orbitalPeriod: "304",
                         diameter: "10465",
                         climate: "arid",
                         gravity: "1",
                         terrain: "desert",
                         surfaceWater: "1",
                         population: "200000",
                         residents: residents,
                         films: films,
                         created: created,
                         edited: edited,
                         url: url)
    }
    
    private var alderaanItem: (model: Planet, json: [String: Any]) {
        let created = dateFormatter.date(from: "2014-12-10T11:35:48.479000Z")!
        let edited = dateFormatter.date(from: "2014-12-20T20:58:18.420000Z")!
        let residents: [URL] = [URL(string: "https://swapi.dev/api/people/5/")!]
        let films: [URL] = [URL(string: "https://swapi.dev/api/films/1/")!]
        let url = URL(string: "https://swapi.dev/api/planets/2/")!

        
        return makeItem(name: "Alderaan",
                        rotationPeriod: "24",
                        orbitalPeriod: "364",
                        diameter: "12500",
                        climate: "temperate",
                        gravity: "1",
                        terrain: "grasslands, mountains",
                        surfaceWater: "40",
                        population: "2000000000",
                        residents: residents,
                        films: films,
                        created: created,
                        edited: edited,
                        url: url)
    }
    
    private var mygeetoItem: (model: Planet, json: [String: Any]) {
        let created = dateFormatter.date(from: "2014-12-10T13:43:39.139000Z")!
        let edited = dateFormatter.date(from: "2014-12-20T20:58:18.446000Z")!
        let residents: [URL] = []
        let films: [URL] = [URL(string: "https://swapi.dev/api/films/6/")!]
        let url = URL(string: "https://swapi.dev/api/planets/16/")!

        return makeItem(name: "Mygeeto",
                        rotationPeriod: "12",
                        orbitalPeriod: "167",
                        diameter: "10088",
                        climate: "frigid",
                        gravity: "1 standard",
                        terrain: "glaciers, mountains, ice canyons",
                        surfaceWater: "unknown",
                        population: "19000000",
                        residents: residents,
                        films: films,
                        created: created,
                        edited: edited,
                        url: url)
    }
    
    private var stewjonItem: (model: Planet, json: [String: Any]) {
        let created = dateFormatter.date(from: "2014-12-10T16:16:26.566000Z")!
        let edited = dateFormatter.date(from: "2014-12-20T20:58:18.452000Z")!
        let residents: [URL] = [URL(string: "https://swapi.dev/api/people/10/")!]
        let films: [URL] = []
        let url = URL(string: "https://swapi.dev/api/planets/20/")!

        return makeItem(name: "Stewjon",
                        rotationPeriod: "unknown",
                        orbitalPeriod: "unknown",
                        diameter: "0",
                        climate: "temperate",
                        gravity: "1 standard",
                        terrain: "grass",
                        surfaceWater: "unknown",
                        population: "unknown",
                        residents: residents,
                        films: films,
                        created: created,
                        edited: edited,
                        url: url)
    }
    
    private var unknownPlanetItem: (model: Planet, json: [String: Any]) {
        let created = dateFormatter.date(from: "2014-12-15T12:25:59.569000Z")!
        let edited = dateFormatter.date(from: "2014-12-20T20:58:18.466000Z")!
        let residents: [URL] = [
            URL(string: "https://swapi.dev/api/people/20/")!,
            URL(string: "https://swapi.dev/api/people/23/")!,
            URL(string: "https://swapi.dev/api/people/29/")!,
            URL(string: "https://swapi.dev/api/people/32/")!,
            URL(string: "https://swapi.dev/api/people/75/")!
        ]
        let films: [URL] = []
        let url = URL(string: "https://swapi.dev/api/planets/28/")!

        return makeItem(name: "unknown",
                      rotationPeriod: "0",
                      orbitalPeriod: "0",
                      diameter: "0",
                      climate: "unknown",
                      gravity: "unknown",
                      terrain: "unknown",
                      surfaceWater: "unknown",
                      population: "unknown",
                      residents: residents,
                      films: films,
                      created: created,
                      edited: edited,
                      url: url)
    }
}

