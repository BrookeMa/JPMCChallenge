//
//  Localized+PlanetList.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 01/05/2023.
//

import Foundation

extension Localized {
    enum PlanetList {
        static var table: String { "PlanetList" }
        
        static var name: String {
            NSLocalizedString("PLANET_LIST_NAME",
                              tableName: table,
                              bundle: bundle,
                              comment: "Name for the planet")
        }
        
        static var rotationPeriod: String {
                NSLocalizedString("PLANET_LIST_ROTATION_PERIOD",
                                  tableName: table,
                                  bundle: bundle,
                                  comment: "Rotation period of the planet")
        }
        
        static var orbitalPeriod: String {
            NSLocalizedString("PLANET_LIST_ORBITAL_PERIOD",
                              tableName: table,
                              bundle: bundle,
                              comment: "Orbital period of the planet")
        }
        
        static var diameter: String {
            NSLocalizedString("PLANET_LIST_DIAMETER",
                              tableName: table,
                              bundle: bundle,
                              comment: "Diameter of the planet")
        }
        
        static var climate: String {
            NSLocalizedString("PLANET_LIST_CLIMATE",
                              tableName: table,
                              bundle: bundle,
                              comment: "Climate of the planet")
        }
        
        static var gravity: String {
            NSLocalizedString("PLANET_LIST_GRAVITY",
                              tableName: table,
                              bundle: bundle,
                              comment: "Gravity of the planet")
        }
        
        static var terrain: String {
            NSLocalizedString("PLANET_LIST_TERRAIN",
                              tableName: table,
                              bundle: bundle,
                              comment: "Terrain of the planet")
        }
        
        static var surfaceWater: String {
            NSLocalizedString("PLANET_LIST_SURFACE_WATER",
                              tableName: table,
                              bundle: bundle,
                              comment: "Surface water of the planet")
        }
        
        static var population: String {
            NSLocalizedString("PLANET_LIST_POPULATION",
                              tableName: table,
                              bundle: bundle,
                              comment: "Population of the planet")
        }
        
        static var residents: String {
            NSLocalizedString("PLANET_LIST_RESIDENTS",
                              tableName: table,
                              bundle: bundle,
                              comment: "Residents of the planet")
        }
        
        static var films: String {
            NSLocalizedString("PLANET_LIST_FILMS",
                              tableName: table,
                              bundle: bundle,
                              comment: "Films related to the planet")
        }
        
        static var created: String {
            NSLocalizedString("PLANET_LIST_CREATED",
                              tableName: table,
                              bundle: bundle,
                              comment: "Creation date of the planet record")
        }
        
        static var edited: String {
            NSLocalizedString("PLANET_LIST_EDITED",
                              tableName: table,
                              bundle: bundle,
                              comment: "Last edit date of the planet record")
        }
        
        static var loadError: String {
            NSLocalizedString("PLANET_LIST_VIEW_CONNECTION_ERROR",
                              tableName: table,
                              bundle: bundle,
                              comment: "Error message displayed when we can't load the articles from the server")
        }
    }
}
