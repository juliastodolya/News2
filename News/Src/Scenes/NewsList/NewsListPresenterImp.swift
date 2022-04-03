import Foundation
import RxSwift

class NewsListPresenterImp: NewsListPresenter {
    private weak var view: NewsListView?
    private let router: NewsListRouter
    private let newsUseCase: NewsUseCase
    private var disposeBag = DisposeBag()
    internal let categoryId: Int
    internal var newsItems = [NewsShortInfo]()
    internal var isLoadingInProcess: Bool {
        return newsUseCase.isLoadingInProcess
    }
    
    init(_ view: NewsListView,
         _ router: NewsListRouter,
         _ categoryId: Int,
         _ newsUseCase: NewsUseCase) {
        self.view = view
        self.router = router
        self.categoryId = categoryId
        self.newsUseCase = newsUseCase
    }
    
    func viewDidLoad() {
        self.subscribeOnNewsUpdates()
        self.getNews(for: self.categoryId)
    }
    
    func subscribeOnNewsUpdates() {
        newsUseCase.source
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] items in
                self?.newsItems = items
                self?.view?.reloadTableView()
            })
            .disposed(by: self.disposeBag)
    }
    
    func getNews(for categoryId: Int) {
        guard self.newsUseCase.hasMorePage else { return }
        self.newsUseCase.getNewsList(for: categoryId)
            .observeOn(MainScheduler.instance)
            .do(onDispose: { [weak self] in
                guard let self = self else { return }
                self.view?.reloadTableView()
            })
            .subscribe(onError: { [weak self] error in
                print(error)
            })
            .disposed(by: self.disposeBag)
    }
        
    func openNewsDetails(for id: Int) {
        self.router.openNewsDetails(for: id)
    }
}
