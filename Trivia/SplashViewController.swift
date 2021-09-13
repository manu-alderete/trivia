//
//  InitialViewController.swift
//  Trivia
//
//  Created by Manuel Tomas Alderete Jabif on 13/09/2021.
//

import UIKit

final class SplashViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hidesNavigationBar = true        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            NavigationHelper.setRoot(SignUpViewController(), animated: true)
        }
    }

}
