//
//  DummyView.swift
//  LoginViewNumber2
//
//  Created by Rafael Oliveira on 09/03/22.
//

import Foundation
import UIKit

class DummyViewController: UIViewController{
    
    let stackView = UIStackView()
    let titleLabel = UILabel()
    let logoutButton = UIButton(type: .system)
    
    weak var logoutDelegate: LogoutDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    
}

extension DummyViewController{
    
    func style(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.axis = .vertical
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Welcome"
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setTitle("Logout", for: [])
        logoutButton.configuration = .filled()
        logoutButton.addTarget(self, action: #selector(logoutButtonPressed), for: .primaryActionTriggered)
        
        
    }
    
    func layout(){
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(logoutButton)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    @objc func logoutButtonPressed(sender: UIButton) {
        logoutDelegate?.didLogout()
    }
}
