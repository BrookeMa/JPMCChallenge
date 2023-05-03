//
//  MainQueueDispatchDecorator.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 02/05/2023.
//

import Foundation

final class MainQueueDispatchDecorator<T> {
    private let decoratee: T

    init(decoratee: T) {
        self.decoratee = decoratee
    }

    func dispatch(completion: @escaping () -> Void) {
        guard Thread.isMainThread else {
            return DispatchQueue.main.async(execute: completion)
        }

        completion()
    }
}

extension MainQueueDispatchDecorator: PlanetLoader where T == PlanetLoader {
    func load(completion: @escaping (PlanetLoader.Result) -> Void) {
        decoratee.load { [weak self] result in
            self?.dispatch { completion(result) }
        }
    }
}
