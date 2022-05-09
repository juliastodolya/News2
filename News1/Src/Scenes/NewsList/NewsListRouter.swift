import UIKit

class NewsListRouter {
    weak var view: UIViewController!

    init(_ view: NewsListViewController) {
        self.view = view
    }

    func openNewsDetails(for id: Int) {
        guard let navigationController = self.view.navigationController else {
            return
        }
        NewsDetailsConfigurator.open(navigationController: navigationController,
                                     newsId: id)
    }
}
