import Foundation
import RxSwift

protocol NewsUseCase {
    var source: PublishSubject<[NewsShortInfo]> { get }
    var isLoadingInProcess: Bool { get }
    var currentPage: Int { get }
    var totalItemsCount: Int? { get }
    var hasMorePage: Bool { get }

    func getNewsCategories() -> Single<NewsCategoryList>
    func getNewsList(for categoryId: Int) -> Completable
    func getNewsDetails(for id: Int) -> Single<NewsDetailsEntity>
}

class NewsUseCaseImp: NewsUseCase {
    private let apiNewsGateway: ApiNewsGateway

    public var source = PublishSubject<[NewsShortInfo]>()
    public var isLoadingInProcess = false
    public var hasMorePage = true
    public var currentPage = 1
    public var totalItemsCount: Int?
    private var items = [NewsShortInfo]()

    private var requestsBag = DisposeBag()

    init(_ apiNewsGateway: ApiNewsGateway) {
        self.apiNewsGateway = apiNewsGateway
    }

    func getNewsCategories() -> Single<NewsCategoryList> {
        return self.apiNewsGateway.getNewsCategories()
            .observeOn(MainScheduler.instance)
    }

    func getNewsList(for categoryId: Int) -> Completable {
        return .deferred {
            self.cancelLoading()
            self.isLoadingInProcess = true
            return self.apiNewsGateway.getNewsList(for: categoryId,
                                                   page: self.currentPage)
                .do(onSuccess: { (result: PaginationEntity<NewsShortInfo>) in
                    self.currentPage += 1
                    self.items.append(contentsOf: result.list)
                    self.source.onNext(self.items)
                    self.isLoadingInProcess = false
                    if result.list.isEmpty {
                        self.hasMorePage = false
                    }
                }, onError: { error in
                    self.isLoadingInProcess = false
                    print("PaginationSourceUseCase: catch error =", error.localizedDescription)
                })
                .asCompletable()
        }
    }

    private func cancelLoading() {
        requestsBag = DisposeBag()
    }

    func getNewsDetails(for id: Int) -> Single<NewsDetailsEntity> {
        return self.apiNewsGateway.getNewsDetails(for: id)
            .observeOn(MainScheduler.instance)
    }
}
