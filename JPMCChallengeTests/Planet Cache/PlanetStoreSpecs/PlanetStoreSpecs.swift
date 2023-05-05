//
//  PlanetStoreSpecs.swift
//  JPMCChallengeTests
//
//  Created by Ye Ma on 04/05/2023.
//

import Foundation

protocol PlanetStoreSpecs {
    func test_retrieve_deliversEmptyOnEmptyCache()
    func test_retrieve_hasNoSideEffectsOnEmptyCache()
    func test_retrieve_deliversFoundValuesOnNonEmptyCache()
    func test_retrieve_hasNoSideEffectsOnNonEmptyCache()
    
    func test_insert_deliversNoErrorOnEmptyCache()
    func test_insert_deliversNoErrorOnNonEmptyCache()
    func test_insert_overridesPreviouslyInsertedCacheValues()
    
    func test_delete_deliversNoErrorOnEmptyCache()
    func test_delete_hasNoSideEffectsOnEmptyCache()
    func test_delete_deliversNoErrorOnNonEmptyCache()
    func test_delete_emptiesPreviouslyInsertedCache()
    
    func test_storeSideEffects_runSerially()
}

protocol FailableRetrievePlanetStoreSpecs: PlanetStoreSpecs {
    func test_retrieve_deliversFailureOnRetrievalError()
    func test_retrieve_hasNoSideEffectsOnFailure()
}

protocol FailableInsertPlanetStoreSpecs: PlanetStoreSpecs {
    func test_insert_deliverErrorOnInsertionError()
    func test_insert_hasNoSideEffectsOnInsertionError()
}

protocol FailableDeletePlanetStoreSpecs: PlanetStoreSpecs {
    func test_delete_deliversErrorOnDeletionError()
    func test_delete_hasNoSideEffectsOnDeletionError()
}
