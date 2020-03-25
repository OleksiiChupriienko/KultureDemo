//
//  LoginViewController.swift
//  KultureDemo
//
//  Created by Aleksei Chupriienko on 25.03.2020.
//  Copyright © 2020 Aleksei Chupriienko. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var phoneNumberLabel: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    var modelController: ModelController!
    var networkService: KultureApi!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons(buttons: [logInButton])
    }
    
    @IBAction func logInAction(_ sender: Any) {
        guard let password = passwordTextField.text, let phoneNumber = phoneNumberLabel.text else { return }
        networkService.logIn(password: password, phoneNumber: phoneNumber) { [weak self] (token) in
            self?.modelController.userData = UserData(token: token)
            guard let token = self?.modelController.userData.token, token != "err" else {
                DispatchQueue.main.async {
                    self?.showAlert(title: "Error", message: "Couldn`t log in")
                }
                return
            }
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let classesVc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
                classesVc.modelController = self?.modelController
                classesVc.networkService = self?.networkService
                self?.navigationController?.show(classesVc, sender: nil)
            }
        }
    }
    
    private func setUpButtons(buttons: [UIButton]) {
        buttons.forEach { $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor.gray.cgColor
            $0.layer.cornerRadius = 7
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok",
                                     style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
