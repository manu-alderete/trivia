//
//  SignUpViewController.swift
//  Trivia
//
//  Created by Manuel Tomas Alderete Jabif on 13/09/2021.
//

import UIKit

final class SignUpViewController: BaseViewController {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var informationButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hidesNavigationBar = true
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.cornerRadius = iconImageView.bounds.width / 2
        
        informationButton.layer.cornerRadius = 5
        informationButton.layer.masksToBounds = true
        informationButton.addTarget(self, action: #selector(informationHandler), for: .touchUpInside)
        
        signUpButton.layer.cornerRadius = signUpButton.bounds.height / 2
        signUpButton.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
    }
    
    @objc private func signUpPressed() {
        NavigationHelper.setRoot(TabBarController())
    }
    
    @objc private func informationHandler() {
        let vc = InformationViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
