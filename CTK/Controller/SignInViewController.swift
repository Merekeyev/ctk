//
//  ViewController.swift
//  CTK
//
//  Created by Temirlan Merekeyev on 1/13/19.
//  Copyright © 2019 Temirlan Merekeyev. All rights reserved.
//

import UIKit
import Moya

class SignInViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    fileprivate var provider = MoyaProvider<SignInService>()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func SingInClicked(_ sender: UIButton) {
        validate()
        singin()
    }
    
    private func setupView(){
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func validate(){
        if loginTextField.text == ""{
            
        }
    }
    
    private func singin(){
        provider.request(.signIn(loginTextField.text!, passwordTextField.text!), completion: { [weak self](result) in
            switch result{
            case .success(let response):
                do{
                    guard let json = try response.mapJSON() as? [String: Any] else {
                        print("Mapping Problem")
                        return
                    }
                    if json["status"] as! Int == 0{
                        print("SIGN IN ERROR")
                    }else {
                        let user = User(JSON: json)
                        guard let tabBarViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController else {return}
                        tabBarViewController.user = user
                        let appDelegate = UIApplication.shared.delegate
                        appDelegate?.window??.rootViewController = tabBarViewController
                    }
                }catch {
                    print("Error \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Error \(error.localizedDescription)")
            }
        })
    }
}

extension SignInViewController: UITextFieldDelegate{
    
}

