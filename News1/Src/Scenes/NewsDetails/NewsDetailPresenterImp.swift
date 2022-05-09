import Foundation
import RxSwift

class NewsDetailsPresenterImp: NewsDetailsPresenter {
    private weak var view: NewsDetailsView?
    private let router: NewsDetailsRouter
    private let newsId: Int
    private let newsUseCase: NewsUseCase
    private var disposeBag = DisposeBag()
    var newsItemDetailed: NewsDetailsInfo?

    init(_ view: NewsDetailsView,
         _ router: NewsDetailsRouter,
         _ newsId: Int,
         _ newsUseCase: NewsUseCase) {
        self.view = view
        self.router = router
        self.newsId = newsId
        self.newsUseCase = newsUseCase
    }

    func viewDidLoad() {
        self.getNewsDetails(for: self.newsId)
    }

    func getNewsDetails(for newsId: Int) {
        self.newsUseCase.getNewsDetails(for: newsId)
            .observeOn(MainScheduler.instance)
            .do(onDispose: { [weak view = self.view] in
                view?.updateUI(with: self.newsItemDetailed)
            })
            .subscribe { [weak self] newsItem in
                if let newsItemDetailed = newsItem.news {
                    self?.newsItemDetailed = newsItemDetailed
                }
            } onError: { error in
                print(error)
            }
            .disposed(by: disposeBag)
    }
}
