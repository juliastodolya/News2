import UIKit

class NewsDetailsViewController: UIViewController, NewsDetailsView {
    internal var presenter: NewsDetailsPresenter!

    @IBOutlet var newsTitle: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var fullDescription: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }

    func updateUI(with data: NewsDetailsInfo?) {
        self.newsTitle.text = data?.title ?? ""

        let fullDescriptionText = data?.fullDescription ?? ""
        if fullDescriptionText.contains("<") && fullDescriptionText.contains(">") {
            self.fullDescription.attributedText = fullDescriptionText.convertHtml()
            self.fullDescription.sizeToFit()
        } else {
            self.fullDescription.text = fullDescriptionText
        }

        if let dateCreate = data?.date {
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
