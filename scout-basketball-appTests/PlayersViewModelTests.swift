//
//  PlayersViewModelTests.swift
//  scout-basketball-appTests
//
//  Created by Jéssica Araujo on 16/02/21.
//

import XCTest
import CoreData
@testable import scout_basketball_app

class PlayersViewModelTests: XCTestCase {
    
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

    var sut: PlayersViewModel!
    
    override func setUp() {
        
        super.setUp()
        sut = PlayersViewModel()
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func test_create_new_player() {
        
        let playersListBeforeCreateNewOne = sut.fetchAllPlayers(viewContext: mockPersistentContainer.viewContext).count
        
        _ = sut.createPlayer(name: "Name For Test", isFirstString: true, numeration: 2, position: "Tests", viewContext: mockPersistentContainer.viewContext)
        
        let playersListsAfterCreateNewOne = sut.fetchAllPlayers(viewContext: mockPersistentContainer.viewContext).count
        
        XCTAssertTrue(playersListsAfterCreateNewOne == playersListBeforeCreateNewOne + 1)
    }
    
    func test_delete_player() {
        
        let newPlayer = sut.createPlayer(name: "Name For Test", isFirstString: true, numeration: 2, position: "Tests", viewContext: mockPersistentContainer.viewContext)
        
        let playersListBeforeDeleting = sut.fetchAllPlayers(viewContext: mockPersistentContainer.viewContext).count
            
        sut.deletePlayer(player: newPlayer!, viewContext: mockPersistentContainer.viewContext)
        
        let playersListAfterDeleting = sut.fetchAllPlayers(viewContext: mockPersistentContainer.viewContext).count
        
        
        XCTAssertTrue(playersListBeforeDeleting == playersListAfterDeleting + 1)
    }
}
