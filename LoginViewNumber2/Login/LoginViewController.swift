//
//  ViewController.swift
//  LoginViewNumber2
//
//  Created by Rafael Oliveira on 28/02/22.
//

import UIKit


protocol LogoutDelegate: AnyObject{
    func didLogout()
}
protocol LoginViewControllerDelegate: AnyObject{
    func didLogin()
    // func didLogin(_ sender: LoginViewController) Used to pass data
}

class LoginViewController: UIViewController {
    
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessage = UILabel()
    
    weak var delegate: LoginViewControllerDelegate?
    
    var username: String?{
        return loginView.usernameTextField.text
    }
    
    var password: String?{
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        signInButton.configuration?.showsActivityIndicator = false
    }

}


extension LoginViewController{
    private func style(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.text = "Bankey"
        
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.textAlignment = .center
        subTitleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        subTitleLabel.text = "Your premium source for all things banking!"
        subTitleLabel.numberOfLines = 0
        
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInPressed), for: .primaryActionTriggered)
        
        errorMessage.translatesAutoresizingMaskIntoConstraints = false
        errorMessage.textColor = .systemRed
        errorMessage.textAlignment = .center
        
    }
    
    private func layout(){
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessage)
        
        NSLayoutConstraint.activate([

            titleLabel.bottomAnchor.constraint(equalTo: subTitleLabel.topAnchor, constant: -32),
            titleLabel.leadingAnchor.constraint(equalTo: subTitleLabel.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: subTitleLabel.trailingAnchor),

            subTitleLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -16),
            subTitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.safeAreaLayoutGuide.trailingAnchor, multiplier: 1)
        
        ])
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
            errorMessage.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessage.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessage.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
        ])
    }
}

extension LoginViewController{
    @objc func signInPressed(sender: UIButton){
        errorMessage.isHidden = true
        login()
    }
    
    private func login(){
        guard let username = username, let password = password else{
            assertionFailure("Username / password should never e nil")
            return
        }
        
        if username == "Rafael" && password == "wagner46"{
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
        
        if username.isEmpty || password.isEmpty{
            configureView(withMessage: "Username / password cannot be blank")
        }
        
    }
    private func configureView(withMessage message: String){
        errorMessage.isHidden = false
        errorMessage.text = message
    }
}








