//
//  NBBMatchesView.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 05/02/21.
//

import UIKit

class NBBMatchesView: UIView, ViewCode {
    
    let nbbMatchesTableView: UITableView = {
       
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        
        self.backgroundColor = .white
        setupNBBMatchesTableView()
    }
    
    func setupViewElementsHierarchy() {
        
        addSubview(nbbMatchesTableView)
    }
    
    func setupViewElementsConstraints() {
        
        NSLayoutConstraint.activate([
            
            nbbMatchesTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            nbbMatchesTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            nbbMatchesTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            nbbMatchesTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    private func setupNBBMatchesTableView() {
        
        nbbMatchesTableView.register(NBBMatchesTableViewCell.self, forCellReuseIdentifier: NBBMatchesTableViewCell.reuseIdentifier)
        nbbMatchesTableView.delegate = self
        nbbMatchesTableView.dataSource = self
    }
}

extension NBBMatchesView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NBBMatchesTableViewCell.reuseIdentifier) as? NBBMatchesTableViewCell else {
                return NBBMatchesTableViewCell()
            }
        
        return cell
    }
}
