//
//  StartViewModelTests.swift
//  scout-basketball-appTests
//
//  Created by Jéssica Araujo on 16/02/21.
//

import XCTest
import CoreData
@testable import scout_basketball_app

class StartViewModelTests: XCTestCase {
    
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
                fatalError("create an in-memory failed \(error?.localizedDescription)")
            }
        }
        
        return container
    }()
    
    var sut: StartViewModel!
   
    override func setUp() {
        
        super.setUp()
        sut = StartViewModel()
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testCreateUserTeam() {
        
        let userTeamsListBeforeChanges = sut.fetchAllTeams(viewContext: mockPersistentContainer.viewContext)
        
        let _ = sut.createTeam(teamName: "Title for Tests", viewContext: mockPersistentContainer.viewContext)
    
        let userTeamsListAfterChanges = sut.fetchAllTeams(viewContext: mockPersistentContainer.viewContext)
        
        XCTAssertEqual(userTeamsListBeforeChanges.count, userTeamsListAfterChanges.count - 1)
    }
}
