import Foundation
import RxSwift

class NewsCategoriesPresenterImp: NewsCategoriesPresenter {
    private weak var view: NewsCategoriesView!
    private let router: NewsCategoriesRouter
    private let newsUseCase: NewsUseCase
    private var disposeBag = DisposeBag()
    internal var newsCategoryItems: [NewsCategory]?
    
    init(_ view: NewsCategoriesView,
         _ router: NewsCategoriesRouter,
         _ newsUseCase: NewsUseCase) {
        self.view = view
        self.router = router
        self.newsUseCase = newsUseCase
    }
    
    func getCategories() {
        self.newsUseCase.getNewsCategories()
            .observeOn(MainScheduler.instance)
            .do(onSubscribe: { [weak view = self.view] in //view?.showActivityIndicator() },
            },
                onDispose: { [weak view = self.view] in //view?.hideActivityIndicator() })
                    view?.reloadTableView()
                })
            .subscribe { [weak self] categories in
                if let categories = categories.list {
                    self?.newsCategoryItems = categories
                }
            } onError: { error in
                print(error)
            }
            .disposed(by: disposeBag)
    }
    
    func openNewsList(for categoryId: Int) {
        self.router.openNewsList(for: categoryId)
    }
}
