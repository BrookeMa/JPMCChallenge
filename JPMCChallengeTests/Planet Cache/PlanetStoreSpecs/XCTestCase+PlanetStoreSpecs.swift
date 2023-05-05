//
//  XCTestCase+PlanetStoreSpecs.swift
//  JPMCChallengeTests
//
//  Created by Ye Ma on 04/05/2023.
//

import XCTest
import JPMCChallenge

extension PlanetStoreSpecs where Self: XCTestCase {
    
    func assertThatRetrieveDeliversEmptyOnEmptyCache(on sut: PlanetStore, file: StaticString = #filePath, line: UInt = #line) {
        expect(sut, toRetrieve: .success(.none), file: file, line: line)
    }
    
    func assertThatRetrieveHasNoSideEffectsOnEmptyCache(on sut: PlanetStore, file: StaticString = #filePath, line: UInt = #line) {
        expect(sut, toRetrieveTwice: .success(.none), file: file, line: line)
    }
    
    func assertThatRetrieveDeliversFoundValuesOnNonEmptyCache(on sut: PlanetStore, file: StaticString = #filePath, line: UInt = #line) {
        let planets = uniquePlanetItem().local
        let timestamp = Date()
        
        insert((planets, timestamp), to: sut)
        
        expect(sut, toRetrieve: .success(CachedPlanet(planets: planets, timestamp: timestamp)), file: file, line: line)
    }
    
    func assertThatRetrieveHasNoSideEffectsOnNOnEmptyCache(on sut: PlanetStore, file: StaticString = #filePath, line: UInt = #line) {
        let planets = uniquePlanetItem().local
        let timestamp = Date()
        
        insert((planets, timestamp), to: sut)
        
        expect(sut, toRetrieve: .success(CachedPlanet(planets: planets, timestamp: timestamp)), file: file, line: line)
    }
    
    func assertThatInsertDeliversNoErrorOnEmptyCache(on sut: PlanetStore, file: StaticString = #filePath, line: UInt = #line) {
        let insertionError = insert((uniquePlanetItem().local, Date()), to: sut)
        
        XCTAssertNil(insertionError, "Expected to insert cache successfully", file: file, line: line)
    }
    
    func assertThatInsertDeliversNoErrorOnNonEmptyCache(on sut: PlanetStore, file: StaticString = #filePath, line: UInt = #line) {
        insert((uniquePlanetItem().local, Date()), to: sut)
        
        let insertionError = insert((uniquePlanetItem().local, Date()), to: sut)
        
        XCTAssertNil(insertionError, "Expected to override cache successfully", file: file, line: line)
    }
    
    func assertThatInsertOverridesPreviouslyInsertedCacheValues(on sut: PlanetStore, file: StaticString = #filePath, line: UInt = #line) {
        insert((uniquePlanetItem().local, Date()), to: sut)
        
        let latestPlanet = uniquePlanetItem().local
        let latestTimestamp = Date()
        insert((latestPlanet, latestTimestamp), to: sut)
        
        expect(sut, toRetrieve: .success(CachedPlanet(planets: latestPlanet, timestamp: latestTimestamp)), file: file, line: line)
    }
    
    func assertThatDeleteDeliversNoErrorOnEmptyCache(on sut: PlanetStore, file: StaticString = #filePath, line: UInt = #line) {
        let deleteError = deleteCache(from: sut)
        
        XCTAssertNil(deleteError, "Expected empty cache deletion to succeed", file: file, line: line)
    }
    
    func assertThatDeleteHasNoSideEffectsOnEmptyCache(on sut: PlanetStore, file: StaticString = #filePath, line: UInt = #line) {
        deleteCache(from: sut)
        
        expect(sut, toRetrieve: .success(.none), file: file, line: line)
    }
    
    func assertThatDeleteDeliversNoErrorOnNonEmptyCache(on sut: PlanetStore, file: StaticString = #filePath, line: UInt = #line) {
        insert((uniquePlanetItem().local, Date()), to: sut)
        
        let deletionError = deleteCache(from: sut)
        
        XCTAssertNil(deletionError, "Expected non-empty cache deletion to succeed", file: file, line: line)
    }
    
    func assertThatDeleteEmptiesPreviouslyInsertedCache(on sut: PlanetStore, file: StaticString = #filePath, line: UInt = #line) {
        insert((uniquePlanetItem().local, Date()), to: sut)
        
        deleteCache(from: sut)
        
        expect(sut, toRetrieve: .success(.none), file: file, line: line)
    }
    
    func assertThatSideEffectsRunSerially(on sut: PlanetStore, file: StaticString = #filePath, line: UInt = #line) {
        var completedOpertionsInOrder = [XCTestExpectation]()
        
        let op1 = expectation(description: "Operation 1")
        sut.insert(uniquePlanetItem().local, timestamp: Date()) { _ in
            completedOpertionsInOrder.append(op1)
            op1.fulfill()
        }
        
        let op2 = expectation(description: "Operation 2")
        sut.insert(uniquePlanetItem().local, timestamp: Date()) { _ in
            completedOpertionsInOrder.append(op2)
            op2.fulfill()
        }
        
        let op3 = expectation(description: "Operation 3")
        sut.insert(uniquePlanetItem().local, timestamp: Date()) { _ in
            completedOpertionsInOrder.append(op3)
            op3.fulfill()
        }
        
        waitForExpectations(timeout: 5.0)
        
        XCTAssertEqual(completedOpertionsInOrder, [op1, op2, op3], "Expected side-effects to run serially but operations finished in the wrong order", file: file, line: line)
    }
}

extension PlanetStoreSpecs where Self: XCTestCase {
    @discardableResult
    func insert(_ cache: (planets: [LocalPlanet], timestamp: Date), to sut: PlanetStore) -> Error? {
        let exp = expectation(description: "Wait for cache insertion")
        var insertionError: Error?
        sut.insert(cache.planets, timestamp: cache.timestamp) { result in
            if case let Result.failure(error) = result { insertionError = error }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
        return insertionError
    }
    
    @discardableResult
    func deleteCache(from sut: PlanetStore) -> Error? {
        let exp = expectation(description: "Wait for cache deletion")
        var deletionError: Error?
        sut.deleteCachedPlanet { result in
            if case let Result.failure(error) = result { deletionError = error }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
        return deletionError
    }
    
    func expect(_ sut: PlanetStore, toRetrieveTwice expectedResult: PlanetStore.RetrievalResult, file: StaticString = #filePath, line: UInt = #line) {
        expect(sut, toRetrieve: expectedResult, file: file, line: line)
        expect(sut, toRetrieve: expectedResult, file: file, line: line)
    }
    
    func expect(_ sut: PlanetStore, toRetrieve expectedResult: PlanetStore.RetrievalResult, file: StaticString = #filePath, line: UInt = #line) {
        let exp = expectation(description: "Wait for cache retrieval")
        
        sut.retrieve { retrievedResult in
            switch (expectedResult, retrievedResult) {
            case (.success(.none), .success(.none)),
                (.failure, .failure):
                break
                
            case let (.success(.some(expected)), .success(.some(retrieved))):
                XCTAssertEqual(retrieved.planets, expected.planets, file: file, line: line)
                XCTAssertEqual(retrieved.timestamp, expected.timestamp, file: file, line: line)
                
            default:
                XCTFail("Expected to retrieve \(expectedResult), got \(retrievedResult) instead", file: file, line: line)
            }
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1.0)
    }
}
