//
//  TabBarController.swift
//  Trivia
//
//  Created by Manuel Tomas Alderete Jabif on 15/09/2021.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let questionNavigationController = QuestionViewController(
            viewModel: QuestionViewModel(questionService: QuestionService())
        )
        questionNavigationController.tabBarItem = UITabBarItem(
            title: "Questions",
            image: UIImage(systemName: "shuffle")?.withTintColor(.lightGray),
            selectedImage: UIImage(systemName: "shuffle")?.withTintColor(.blue)
        )
        let categoryNavigationController = CategoriesViewController()
        categoryNavigationController.tabBarItem = UITabBarItem(
            title: "Categories",
            image: UIImage(systemName: "list.bullet")?.withTintColor(.lightGray),
            selectedImage: UIImage(systemName: "list.bullet")?.withTintColor(.blue)
        )
        
        viewControllers = [
            categoryNavigationController,
            questionNavigationController
        ]
    }
}
