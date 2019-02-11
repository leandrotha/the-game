//
//  LoginViewController.swift
//  the-game
//
//  Created by Livetouch on 12/12/18.
//  Copyright © 2018 Leandro B Tha. All rights reserved.
//

import UIKit
import Alamofire

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
        view.backgroundColor = Constants.backgroundWhite()
    }
    
    static func factorial(_ n: Int) {
        
    }
    
    //MARK: - Actions
    
    @IBAction func onClickContinuar(sender: UIButton) {
        self.navigationController?.present(HomeViewController(), animated: true, completion: nil)
    }
    
    @IBAction func onClickNaoPossuoLogin(_ sender: Any) {
        self.navigationController?.pushViewController(CadastroViewController(), animated: true)
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

extension Task {
    static func calculate(_ n: Int) -> Task {
        return Task { controller in
            Alamofire.request(URL(string: "https://jsonplaceholder.typicode.com/posts")!).responseJSON(completionHandler: { response in
                if let error = response.error {
                    controller.failure(error)
                } else if response.result.isSuccess {
                    do {
                       try Parser.parserPlaceholder(data: response.data)
                        controller.finish()
                    } catch let error {
                        controller.failure(error)
                    }
                }
            })
        }
    }
}
