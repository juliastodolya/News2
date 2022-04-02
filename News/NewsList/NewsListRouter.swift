import UIKit

class NewsListRouter {
    
    weak var view: UIViewController!
    
    init(_ view: NewsListViewController) {
        self.view = view
    }
    
    func openSomeScene() {
        if let navController = self.view.navigationController {
            //  SomeSceneConfigurator.open(navigationController: navController)
        }
    }
}
