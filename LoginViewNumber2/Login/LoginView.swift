//
//  LoginView.swift
//  LoginViewNumber2
//
//  Created by Rafael Oliveira on 28/02/22.
//

import UIKit


class LoginView: UIView{
    
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let divisorView = UIView()
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


extension LoginView{
    
    func style(){
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.axis = .vertical
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
        
        divisorView.translatesAutoresizingMaskIntoConstraints = false
        divisorView.backgroundColor = .secondarySystemFill
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    func layout(){
        
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(divisorView)
        stackView.addArrangedSubview(passwordTextField)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        divisorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
}

extension LoginView: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
}
