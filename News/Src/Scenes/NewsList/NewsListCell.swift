import UIKit

class NewsListCell: UITableViewCell {
    @IBOutlet var title: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var shortDescription: UILabel!
    
    func setupCell(with info: NewsShortInfo?) {
        self.title?.text = info?.title ?? ""
        self.shortDescription?.text = info?.shortDescription ?? ""
        
        if let dateCreate = info?.date {
            guard let date =
                    DateFormatter.utcFullISO8610Format.date(from: dateCreate) else {
                self.time.text = ""
                return
            }
            let formattedDate = DateFormatter.defaultFormatter.string(from: date)
            self.time.text = formattedDate
        }
    }
}
