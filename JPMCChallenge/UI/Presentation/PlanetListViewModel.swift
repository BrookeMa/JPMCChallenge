//
//  PlanetListViewModel.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 01/05/2023.
//

import UIKit

final class PlanetListViewModel {
    typealias Observer<T> = (T) -> Void
    
    private let planetLoader: PlanetLoader
    
    init(planetLoader: PlanetLoader) {
        self.planetLoader = planetLoader
    }
    
    var onLoadingStateChange: Observer<Bool>?
    var onPlanetsLoad: Observer<[Planet]>?
    var onLoadError: Observer<String>?
    
    func loadPlanets() {
        onLoadingStateChange?(true)
        planetLoader.load { [weak self] result in
            switch result {
            case let .success(planets):
                self?.onPlanetsLoad?(planets)
            case .failure:
                self?.onLoadError?(Localized.PlanetList.loadError)
            }
            self?.onLoadingStateChange?(false)
        }
    }
}
