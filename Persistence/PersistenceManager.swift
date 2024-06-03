//
//  PersistenceManager.swift
//
//  Created by AhmedFitoh on 07/05/2024
//

import RealmSwift

/// A singleton class that manages the persistence of the universities data.
/// It uses Realm as the persistence store.
final class PersistenceManager {
    static let shared = PersistenceManager()
    private let realm: Realm

    private init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to initialize Realm, error: \(error)")
        }
    }

    /// Saves the given array of universities to the Realm database.
    /// 
    /// - Parameter list: The array of universities to be saved.
    func saveUniversity(list: [University]) {
        do {
            try realm.write {
                realm.add(list, update: .modified)
            }
        } catch {
            print("Failed to save universities, error: \(error)")
        }
    }


    /// Retrieve the list of universities from the persistence store.
    /// - Returns: An array of `University` objects.
    func retrieveUniversityList() -> [University] {
        return Array(realm.objects(University.self))
    }
}
