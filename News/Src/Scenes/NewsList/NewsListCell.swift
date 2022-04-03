import UIKit

class NewsListCell: UITableViewCell {
    @IBOutlet var title: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var shortDescription: UILabel!
    
    func setupCell(with info: NewsShortInfo?) {
        self.title?.text = info?.title ?? ""
        self.time?.text = info?.date ?? ""
        self.shortDescription?.text = info?.shortDescription ?? ""
    }
}
