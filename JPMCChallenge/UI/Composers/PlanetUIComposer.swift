//
//  PlanetUIComposer.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 01/05/2023.
//

import UIKit

public final class PlanetUIComposer {
    public init() {}
    
    
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
