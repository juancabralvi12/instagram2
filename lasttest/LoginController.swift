//
//  LoginController.swift
//  lasttest
//
//  Created by Juan Cabral on 12/10/19.
//  Copyright © 2019 Juan Cabral. All rights reserved.
//

//
//  LoginController.swift
//  instagram
//
//  Created by Juan Cabral on 4/14/19.
//  Copyright © 2019 Juan Cabral. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    let logoContainerView : UIView = {
        let view = UIView()
        
        let logoImageView = UIImageView(image: UIImage(named: "Instagram_logo_white"))
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(logoImageView)
        
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
        logoImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.backgroundColor = UIColor(red: 0, green: 120/255, blue: 175/255, alpha: 1)
        return view
        
    }()
    
    let emailTextField : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle = .roundedRect
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()
    
    let passwordTextField : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle = .roundedRect
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()
    
    @objc func handleTextInputChange(){
        if !(emailTextField.text?.isEmpty ?? false)
            && !(passwordTextField.text?.isEmpty ?? false) {
            loginButton.backgroundColor = UIColor.rgb(red: 17, green: 154, blue: 237)
            loginButton.isEnabled = true
        } else {
            loginButton.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
            loginButton.isEnabled = false
        }
    }
    
    let loginButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        
        button.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handle), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    @objc func handle(){
        print("Hello world")
        let feedController = FeedController()
        navigationController?.pushViewController(feedController, animated: true)
    }
    
    @objc func handleLogin(){
        print("handling login")
        navigationController?.pushViewController(Feed(collectionViewLayout: UICollectionViewFlowLayout()), animated:   true)
    }
    
    lazy var dontHaveAnAccountButton : UIButton = {
        let button = UIButton(type: .system)
        let attributedText = NSMutableAttributedString(string: "Don't have an account? ",
                                                       attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray,
                                                                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: "Sign Up.",
                                                 attributes: [NSAttributedString.Key.foregroundColor : UIColor.rgb(red: 17, green: 154, blue: 237),
                                                              NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]))
        
        button.setAttributedTitle(attributedText, for: .normal)
        button.addTarget(self, action: #selector(handleDontHaveAnAccount), for: .touchUpInside)
        return button
    }()
    
    
    
    
    
    @objc func handleDontHaveAnAccount(){
        print("handling do not have account")
    }
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        setupDontHaveAnAccountButton()
        setupLogoContainerView()
        setupInputFields()
    }
    
    fileprivate func setupLogoContainerView(){
        view.addSubview(logoContainerView)
        
        /*logoContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //left
        //widht
        //heigth
        */
        
        logoContainerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 150)
    }
    
    
    
    
    
    
    
    
    fileprivate func setupDontHaveAnAccountButton(){
        view.addSubview(dontHaveAnAccountButton)
        dontHaveAnAccountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    fileprivate func setupInputFields(){
    
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stackView.backgroundColor = .red
        
        //we must need to add the stack view rendering options in order to see the result
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        stackView.anchor(top: logoContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 140)
    }
    
}


