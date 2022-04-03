import UIKit

class NewsDetailsConfigurator {
    func configure(view: NewsDetailsViewController, newsId: Int) {
        let router = NewsDetailsRouter(view)
        let presenter = NewsDetailsPresenterImp(view,
                                                router,
                                                newsId,
                                                DI.resolve())
        view.presenter = presenter
    }

    static func open(navigationController: UINavigationController, newsId: Int) {
        guard let view = R.storyboard.newsDetail.instantiateInitialViewController() else {
            return
        }
        NewsDetailsConfigurator().configure(view: view, newsId: newsId)
        navigationController.pushViewController(view, animated: true)
    }
}
