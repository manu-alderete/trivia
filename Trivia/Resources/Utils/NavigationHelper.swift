//
//  NavigationHelper.swift
//  Trivia
//
//  Created by Manuel Tomas Alderete Jabif on 13/09/2021.
//

import Foundation
import UIKit

struct NavigationHelper {
    
    static func setRoot(_ viewController: UIViewController, animated: Bool = true) {
        let foregroundedScenes = UIApplication.shared.connectedScenes.filter { $0.activationState == .foregroundActive }
        guard let window = foregroundedScenes.map { $0 as? UIWindowScene }.compactMap { $0 }.first?.windows.filter({ $0.isKeyWindow }).first else { return }
        
        window.rootViewController = viewController
        UIView.transition(with: window, duration: 0.3, options: [.transitionCrossDissolve], animations: {}, completion: nil)
    }
}
