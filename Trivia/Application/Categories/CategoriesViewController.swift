//
//  CategoriesViewController.swift
//  Trivia
//
//  Created by Manuel Tomas Alderete Jabif on 15/09/2021.
//

import UIKit
import Alamofire

final class CategoriesViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: CategoriesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CategoriesViewModel(categoriesService: CategoryService())
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            UINib(
                nibName: String(describing: CategoryTableViewCell.self),
                bundle: nil
            ),
            forCellReuseIdentifier: String(describing: CategoryTableViewCell.self)
        )
        //        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: String(describing: CategoryTableViewCell.self))
        viewModel?.getCategories(completion: { [weak self] result in
            switch result {
            case .success(_):
                self?.tableView.reloadData()
            case .failure(_):
                let alert = UIAlertController(title: "Trivia", message: "There has been an error, try again!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
                self?.present(alert, animated: true, completion: nil)
            }
        })
    }
}

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CategoryTableViewCell.self), for: indexPath) as! CategoryTableViewCell
        cell.configure(category: viewModel.categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = QuestionViewController(category: viewModel.categories[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
