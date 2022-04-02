//
//  CategoryCell.swift
//  News
//
//  Created by Юлия on 02.04.2022.
//

import UIKit

class CategoryCell: UITableViewCell {
    @IBOutlet var categoryName: UILabel?
    
    func setupCell(with name: String?) {
        self.categoryName?.text = name ?? ""
    }
}
