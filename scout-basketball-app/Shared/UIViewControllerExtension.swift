//
//  UIViewControllerExtension.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 13/02/21.
//

import UIKit

extension UIViewController {
    
    func setupNavigationBar(titleScreen: String) {
    
        self.navigationItem.title = titleScreen
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.tintColor = .actionColor
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.compactAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
    }
}
