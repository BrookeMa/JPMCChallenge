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
    private let localPlanetLoader: PlanetCache
    
    init(planetLoader: PlanetLoader, localPlanetLoader: PlanetCache) {
        self.planetLoader = planetLoader
        self.localPlanetLoader = localPlanetLoader
    }
    
    var onLoadingStateChange: Observer<Bool>?
    var onPlanetsLoad: Observer<[Planet]>?
    var onLoadError: Observer<String>?
    
    func loadPlanets() {
        onLoadingStateChange?(true)
        Reachability.isConnectedToNetwork() ? loadRemotePlanet() : loadLocalPlanet()
    }
    
    private func loadRemotePlanet() {
        planetLoader.load { [weak self] result in
            switch result {
            case let .success(planets):
                self?.onPlanetsLoad?(planets)
                self?.saveToLocalStore(planets)
            case .failure:
                self?.onLoadError?(Localized.PlanetList.loadError)
            }
            self?.onLoadingStateChange?(false)
        }
    }
    
    private func loadLocalPlanet() {
        localPlanetLoader.load { [weak self] result in
            switch result {
            case let .success(planets):
                self?.onPlanetsLoad?(planets)
            case .failure:
                self?.onLoadError?(Localized.PlanetList.loadError)
            }
            self?.onLoadingStateChange?(false)
        }
    }
    
    private func saveToLocalStore(_ planets: [Planet], completion: (() -> Void)? = nil) {
        localPlanetLoader.save(planets) { result in
            completion?()
        }
    }
}
