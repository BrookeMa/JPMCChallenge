//
//  PlanetUIComposer.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 01/05/2023.
//

import UIKit

public final class PlanetUIComposer {
    public init() {}
    
    public static func planetListComposedWith(planetLoader: PlanetLoader, localPlanetLoader: PlanetCache) -> PlanetListViewController {
        let viewModel = PlanetListViewModel(planetLoader: MainQueueDispatchDecorator(decoratee: planetLoader),
                                            localPlanetLoader: MainQueueDispatchDecorator(decoratee: localPlanetLoader))
        
        let viewController = PlanetListViewController.makeWith(viewModel: viewModel)
        
        viewModel.onPlanetsLoad = adaptPlanetToCellControllers(forwardingTo: viewController)
        
        return viewController
    }
    
    private static func adaptPlanetToCellControllers(forwardingTo controller: PlanetListViewController) -> ([Planet]) -> Void {
        return { [weak controller] planets in
            controller?.tableModel = planets.map { planet in
                let selection: () -> Void = {
                    
                }
                let viewModel = PlanetViewModel(model: planet)
                return PlanetCellController(viewModel: viewModel, selection: selection)
            }
        }
    }
}

private extension PlanetListViewController {
    static func makeWith(viewModel: PlanetListViewModel) -> PlanetListViewController {
        let bundle = Bundle(for: PlanetListViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let viewController = storyboard.instantiateInitialViewController() as! PlanetListViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
