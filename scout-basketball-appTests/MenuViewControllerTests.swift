//
//  MenuViewControllerTests.swift
//  scout-basketball-appTests
//
//  Created by Jéssica Araujo on 17/02/21.
//

import XCTest
@testable import scout_basketball_app

class MenuViewControllerTests: XCTestCase {
    
    var sut: MenuViewController!
    var coordinator: MenuCoordinator!
    var window: UIWindow!
    var menuTableView: UITableView!
    
    override func setUp() {
        
        super.setUp()
        
        window = UIWindow()
        coordinator = MenuCoordinator()
        sut = coordinator.rootViewController as? MenuViewController
        _ = sut.view
        menuTableView = sut.menuContentView.menuTableView
    }
    
    override func tearDown() {
        
        super.tearDown()
        window = nil
        sut = nil
    }
    
    func loadView() {
        
        window.addSubview(sut.menuContentView)
        RunLoop.current.run(until: Date())
    }
    
    func test_has_tableView() {
        
        XCTAssertNotNil(menuTableView)
    }
    
    func test_has_tableView_dataSource() {
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        XCTAssertNotNil(menuTableView.dataSource)
    }
    
    func test_has_tableView_delegate() {
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        XCTAssertNotNil(menuTableView.delegate)
        XCTAssertTrue(menuTableView.delegate === sut, "Controller shoud be delegate for the tableView")
    }
    
    func test_number_of_rows() {
        
        //given
        let rows = 3
        
        //when
        sut.loadViewIfNeeded()
        
        //then
        let numberOfRows = menuTableView.dataSource?.tableView(menuTableView, numberOfRowsInSection: 0)
        
        XCTAssertEqual(numberOfRows, rows)
    }
    
    func test_tableCell_has_correct_label_text(){
        
        let cell0 = sut.tableView(menuTableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? MenuTableViewCell
        
        XCTAssertEqual(cell0?.screensNameLabel.text, "Partidas")
        
        let cell1 = sut.tableView(menuTableView, cellForRowAt: IndexPath(row: 1, section: 0)) as? MenuTableViewCell
        
        XCTAssertEqual(cell1?.screensNameLabel.text, "Jogadores")
        
        let cell2 = sut.tableView(menuTableView, cellForRowAt: IndexPath(row: 2, section: 0)) as? MenuTableViewCell
        
        XCTAssertEqual(cell2?.screensNameLabel.text, "Acompanhe a NBA")
    }
}
