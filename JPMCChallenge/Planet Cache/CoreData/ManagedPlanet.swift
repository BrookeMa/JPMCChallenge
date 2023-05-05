//
//  ManagedPlanet.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 04/05/2023.
//

import CoreData

@objc(ManagedPlanet)
class ManagedPlanet: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var rotationPeriod: String
    @NSManaged var orbitalPeriod: String
    @NSManaged var diameter: String
    @NSManaged var climate: String
    @NSManaged var gravity: String
    @NSManaged var terrain: String
    @NSManaged var surfaceWater: String
    @NSManaged var population: String
    @NSManaged var residents: [URL]
    @NSManaged var films: [URL]
    @NSManaged var created: Date
    @NSManaged var edited: Date
    @NSManaged var url: URL
}

extension ManagedPlanet {
    static func items(from localPlanets: [LocalPlanet], in context: NSManagedObjectContext) -> NSOrderedSet {
        return NSOrderedSet(array: localPlanets.map { localPlanet in
            let managed = ManagedPlanet(context: context)

            managed.name = localPlanet.name
            managed.rotationPeriod = localPlanet.rotationPeriod
            managed.orbitalPeriod = localPlanet.orbitalPeriod
            managed.diameter = localPlanet.diameter
            managed.climate = localPlanet.climate
            managed.gravity = localPlanet.gravity
            managed.terrain = localPlanet.terrain
            managed.surfaceWater = localPlanet.surfaceWater
            managed.population = localPlanet.population
            managed.created = localPlanet.created
            managed.edited = localPlanet.edited
            managed.url = localPlanet.url
            managed.residents = localPlanet.residents
            managed.films = localPlanet.films

            return managed
        })
    }
    
    var local: LocalPlanet {
        return LocalPlanet(name: name,
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
    }
}

