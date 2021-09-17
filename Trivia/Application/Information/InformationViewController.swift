//
//  InformationViewController.swift
//  Trivia
//
//  Created by Manuel Tomas Alderete Jabif on 14/09/2021.
//

import UIKit

class InformationViewController: BaseViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        closeButton.addTarget(self, action: #selector(closeHandler), for: .touchUpInside)
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        titleLabel.alpha = 0.0
    }
    
    @objc private func closeHandler() {
        self.dismiss(animated: true, completion: nil)
    }

}

extension InformationViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= 55 {
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.titleLabel.alpha = 1
            }
        } else {
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.titleLabel.alpha = 0
            }
        }
    }
}
