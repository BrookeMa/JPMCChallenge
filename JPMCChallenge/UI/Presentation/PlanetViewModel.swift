//
//  PlanetViewModel.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 02/05/2023.
//

import Foundation

final class PlanetViewModel {
    
    private let model: Planet
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    } ()
    
    init(model: Planet) {
        self.model = model
    }
    
    var name: String? {
        return model.name
    }
    
    var rotationPeriod: String? {
        return model.rotationPeriod
    }

    var orbitalPeriod: String? {
        return model.orbitalPeriod
    }

    var diameter: String? {
        return model.diameter
    }

    var climate: String? {
        return model.climate
    }

    var gravity: String? {
        return model.gravity
    }

    var terrain: String? {
        return model.terrain
    }

    var surfaceWater: String? {
        return model.surfaceWater
    }

    var population: String? {
        return model.population
    }

    var residents: [URL]? {
        return model.residents
    }

    var films: [URL]? {
        return model.films
    }

    var created: String? {
        return dateFormatter.string(from: model.created)
    }

    var edited: String? {
        return dateFormatter.string(from: model.edited)
    }
}
