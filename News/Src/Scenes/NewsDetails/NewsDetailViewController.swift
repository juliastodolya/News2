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
        self.time.text = data?.date ?? ""
        self.fullDescription.text = data?.fullDescription ?? ""
    }
}
