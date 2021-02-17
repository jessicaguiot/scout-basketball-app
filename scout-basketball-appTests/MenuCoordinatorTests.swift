//
//  MenuCoordinatorTests.swift
//  scout-basketball-appTests
//
//  Created by Jéssica Araujo on 17/02/21.
//

import XCTest
@testable import scout_basketball_app

class MenuCoordinatorTests: XCTestCase {
        
    class MockNavigationController: UINavigationController {
        
        var pushedViewController: UIViewController?
        
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            pushedViewController = viewController
            super.pushViewController(viewController, animated: true)
        }
    }
    
    var sut: MenuViewController!
    var coordinator: MenuCoordinator!
    var mockNavigationController:MockNavigationController!
    var window: UIWindow!
    override func setUp() {
        
        super.setUp()
        coordinator = MenuCoordinator()
        
        sut = coordinator.rootViewController as? MenuViewController
        
        mockNavigationController = MockNavigationController(rootViewController: sut)
        
        _ = sut.menuContentView
        window = UIWindow()
        window.addSubview(sut.menuContentView)
    }
    
    override func tearDown() {
        
        super.tearDown()
        window = nil
    }
    
    func test_showScreens_pushed_correct_matchesViewController() {
        
        //given
        window.rootViewController = mockNavigationController
        window.makeKeyAndVisible()
        
        //when
        sut.loadViewIfNeeded()
        sut.menuCoordinator?.showScreen(toShow: .matches)
        
        //then
        XCTAssertTrue(mockNavigationController.pushedViewController is MatchesViewController)
    }
    
    func test_showScreens_pushed_correct_playersViewController() {
        
        //given
        window.rootViewController = mockNavigationController
        window.makeKeyAndVisible()
        
        //when
        sut.loadViewIfNeeded()
        sut.menuCoordinator?.showScreen(toShow: .players)
        
        //then
        XCTAssertTrue(mockNavigationController.pushedViewController is PlayersViewController)
    }
    
    func test_showScreens_pushed_correct_nbaMatchesViewController() {
        
        //given
        window.rootViewController = mockNavigationController
        window.makeKeyAndVisible()
        
        //when
        sut.loadViewIfNeeded()
        sut.menuCoordinator?.showScreen(toShow: .nbaMatches)
        
        //then
        XCTAssertTrue(mockNavigationController.pushedViewController is NBAMatchesViewController)
    }
}
