//
//  CoreDataPlanetStore.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 04/05/2023.
//

import CoreData

public final class CoreDataPlanetStore: PlanetStore {
    private static let modelName = "PlanetStore"
    private static let model = NSManagedObjectModel.with(name: modelName, in: Bundle(for: CoreDataPlanetStore.self))
    
    private let container: NSPersistentContainer
    private let context: NSManagedObjectContext
    
    enum StoreError: Error {
        case modelNotFound
        case failedToLoadPersistentContainer(Error)
    }
    
    public init(storeURL: URL) throws {
        guard let model = CoreDataPlanetStore.model else {
            throw StoreError.modelNotFound
        }
        
        do {
            container = try NSPersistentContainer.load(name: CoreDataPlanetStore.modelName, model: model, url: storeURL)
            context = container.newBackgroundContext()
        } catch {
            throw StoreError.failedToLoadPersistentContainer(error)
        }
    }
    
    public func deleteCachedPlanet(completion: @escaping DeletionCompletion) {
        perform { context in
            completion(Result {
                try ManagedCache.find(in: context).map(context.delete).map(context.save)
            })
        }
    }
    
    public func insert(_ localPlanets: [LocalPlanet], timestamp: Date, completion: @escaping InsertionCompletion) {
        perform { context in
            completion(Result {
                let managedCache = try ManagedCache.newUniqueInstance(in: context)
                managedCache.timestamp = timestamp
                managedCache.planets = ManagedPlanet.items(from: localPlanets, in: context)
                try context.save()
            })
        }
    }
    
    public func retrieve(completion: @escaping RetrievalCompletion) {
        perform { context in
            completion(Result {
                try ManagedCache.find(in: context).map {
                    return CachedPlanet(planets: $0.localPlanets, timestamp: $0.timestamp)
                }
            })
        }
    }
    
    private func perform(_ action: @escaping (NSManagedObjectContext) -> Void) {
        let context = self.context
        context.perform { action(context) }
    }
}
