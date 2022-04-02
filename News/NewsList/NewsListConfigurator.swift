import UIKit

class NewsListConfigurator {
    func configure(view: NewsListViewController, categoryId: Int) {
        let router = NewsListRouter(view)
        let presenter = NewsListPresenterImp(view,
                                             router,
                                             categoryId,
                                             DI.resolve())
        view.presenter = presenter
    }

    static func open(navigationController: UINavigationController,
                     categoryId: Int) {
        guard let view = R.storyboard.newsList.instantiateInitialViewController() else {
            return
        }
        NewsListConfigurator().configure(view: view, categoryId: categoryId)
        navigationController.pushViewController(view, animated: true)
    }
}
