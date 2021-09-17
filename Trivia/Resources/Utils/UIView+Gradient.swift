//
//  UIView+Gradient.swift
//  Trivia
//
//  Created by Manuel Tomas Alderete Jabif on 14/09/2021.
//

import Foundation
import UIKit

extension UIView {
    func setBackgroundGradient(firstColor: UIColor, secondColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at:0)
    }
}
