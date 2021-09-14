//
//  SignUpViewController.swift
//  Trivia
//
//  Created by Manuel Tomas Alderete Jabif on 13/09/2021.
//

import UIKit

class SignUpViewController: BaseViewController {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hidesNavigationBar = true
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.cornerRadius = iconImageView.bounds.width / 2
        signUpButton.layer.cornerRadius = signUpButton.bounds.height / 2
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        signUpButton.isEnabled = textField.text?.isEmpty ?? false
//        signUpButton.backgroundColor = (textField.text?.isEmpty ?? false)
    }
}
