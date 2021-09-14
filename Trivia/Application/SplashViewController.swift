//
//  InitialViewController.swift
//  Trivia
//
//  Created by Manuel Tomas Alderete Jabif on 13/09/2021.
//

import UIKit

final class SplashViewController: BaseViewController {
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hidesNavigationBar = true
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.cornerRadius = iconImageView.bounds.width / 2
        iconImageView.backgroundColor = .clear
        UIView.transition(with: iconImageView, duration: 1, options: .curveEaseIn, animations: { [weak self] in
            self?.iconImageView.backgroundColor = .white
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            NavigationHelper.setRoot(SignUpViewController(), animated: true)
        }
    }
}
