//
//  LoginViewController.swift
//  the-game
//
//  Created by Livetouch on 12/12/18.
//  Copyright © 2018 Leandro B Tha. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var stackContinuar: UIStackView! {
        didSet {
            stackContinuar.isHidden = true
        }
    }
    
    @IBOutlet weak var stackTextFields: UIStackView! {
        didSet {
            stackTextFields.isHidden = false
        }
    }
    
    @IBOutlet weak var tfEmail: UITextField! {
        didSet {
            tfEmail.delegate = self
            tfEmail.keyboardType = .emailAddress
        }
    }
    
    @IBOutlet weak var tfSenha: UITextField! {
        didSet {
            tfSenha.delegate = self
            tfSenha.isSecureTextEntry = true
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    
    //MARK: - Helpers
    
    func initialSetup() {
        view.backgroundColor = Constants.backgroundGray
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let tfEmail = tfEmail else {return}
        guard let tfSenha = tfSenha else {return}
        
        if let email = tfEmail.text, let senha = tfSenha.text {
            if !email.isEmpty && !senha.isEmpty {
                self.stackContinuar.isHidden = false
            } else {
                self.stackContinuar.isHidden = true
            }
        }
    }
    
    textfield
}
