import UIKit

class CategoryCell: UITableViewCell {
    @IBOutlet var categoryName: UILabel?
    
    func setupCell(with name: String?) {
        self.categoryName?.text = name ?? ""
    }
}
