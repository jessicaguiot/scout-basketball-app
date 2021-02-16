//
//  MatchesViewModelTests.swift
//  scout-basketball-appTests
//
//  Created by Jéssica Araujo on 16/02/21.
//

import XCTest
import CoreData
@testable import scout_basketball_app

class MatchesViewModelTests: XCTestCase {

    //MARK: - Mock in-memory Persistant Store
    lazy var managedObjectModel: NSManagedObjectModel = {
        
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle.main])!
        return managedObjectModel
    }()
    
    lazy var mockPersistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "scout_basketball_appTests", managedObjectModel: self.managedObjectModel)
        
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        description.shouldAddStoreAsynchronously = false
        
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { (description, error) in
            
            precondition(description.type == NSInMemoryStoreType)
            
            if let _ = error {
                fatalError("create an in-memory failed \(String(describing: error?.localizedDescription))")
            }
        }
        
        return container
    }()
    
    var sut: MatchesViewModel!
    
    override func setUp() {
        
        super.setUp()
        sut = MatchesViewModel()
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testCreateNewMatch() {
        
        let matchesListBeforeCreateNewOne = sut.fetchAllPlayers(viewContext: mockPersistentContainer.viewContext)
            
            _ = sut.createMatch(opponentName: "Opponent Test", opponentPoints: 67, userPoints: 35, viewContext: mockPersistentContainer.viewContext)
        
        let matchesListAfterCreateNewOne = sut.fetchAllPlayers(viewContext: mockPersistentContainer.viewContext)
        
        XCTAssertEqual(matchesListBeforeCreateNewOne.count, matchesListAfterCreateNewOne.count - 1)
    }
    
    func testDeleteMatch() {
        
        let newMatch = sut.createMatch(opponentName: "Opponent Test", opponentPoints: 67, userPoints: 35, viewContext: mockPersistentContainer.viewContext)
        
        let matchesListBeforeRemoving = sut.fetchAllPlayers(viewContext: mockPersistentContainer.viewContext).count
        
        sut.deleteMatch(match: newMatch!, viewContext: mockPersistentContainer.viewContext)
        
        let matchesListAfterRemoving = sut.fetchAllPlayers(viewContext: mockPersistentContainer.viewContext).count
        
        XCTAssertTrue(matchesListBeforeRemoving == matchesListAfterRemoving + 1)
    }
}
