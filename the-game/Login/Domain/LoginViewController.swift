//
//  LoginViewController.swift
//  the-game
//
//  Created by Livetouch on 12/12/18.
//  Copyright © 2018 Leandro B Tha. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    var database: DatabaseReference?
    
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
        callFirebase({ [weak self] result in
            guard let self = self else {return}
            self.changeBackgroundWith(color: result)
        })
    }
    
    deinit {
        if let db = database {
            db.removeAllObservers()
        }
    }
    
    //MARK: - Helpers
    
    func callFirebase(_ callback: @escaping (String) -> ()) {
        database = Database.database().reference().child("Color")
        
        guard let db = database else {return}
        
        db.observe(.childChanged, with: { snapshot in
            print("======================\nLISTENING\n======================")
            let value = snapshot.value as! String
            callback(value)
        })
    }
    
    func changeBackgroundWith(color: String) {
        switch color {
        case ".red":
            view.backgroundColor = .red
        case ".blue":
            view.backgroundColor = .blue
        case ".green":
            view.backgroundColor = .green
        default:
            view.backgroundColor = .clear
        }
    }
    
    func initialSetup() {
        view.backgroundColor = Constants.backgroundGray
    }
    
    //MARK: - Actions
    
    @IBAction func onClickContinuar(sender: UIButton) {
        self.navigationController?.setViewControllers([HomeViewController()], animated: true)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let tfEmail = tfEmail else {return true}
        guard let tfSenha = tfSenha else {return true}
        
        if let email = tfEmail.text, let senha = tfSenha.text {
            if !email.isEmpty && !senha.isEmpty {
                self.stackContinuar.isHidden = false
            } else {
                self.stackContinuar.isHidden = true
            }
        }
        
        return true
    }
    
}
