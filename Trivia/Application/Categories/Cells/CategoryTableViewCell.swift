//
//  CategoryTableViewCell.swift
//  Trivia
//
//  Created by Manuel Tomas Alderete Jabif on 15/09/2021.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(category: Category?) {
        titleLabel?.text = category?.name
    }
}
