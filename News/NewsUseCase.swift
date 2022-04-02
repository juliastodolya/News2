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

    //    func getNewsDetail(for id: Int) -> Single<NewsCategories>
}

class NewsUseCaseImp: NewsUseCase {
    
    private let apiNewsGateway: ApiNewsGateway
    
    public var source = PublishSubject<[NewsShortInfo]>()
    public var isLoadingInProcess: Bool = false
    public var hasMorePage: Bool = true
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
}


//class PhotosPaginationUseCaseImp: PhotosPaginationUseCase {
//    public var source = PublishSubject<[NewsShortInfo]>()
//    public var isLoadingInProcess: Bool = false
//    
//    public var currentPage = 1
//    public var totalItemsCount: Int?
//    private var items = [NewsShortInfo]()
//    
//    private let gateway: PhotosPaginationGateway
//    private var limit = 10
//    private var requestsBag = DisposeBag()
//    
//    init(gateway: PhotosPaginationGateway) {
//        self.gateway = gateway
//    }
//    
//    public func hasMorePage() -> Bool {
//        guard let totalItemsCount = self.totalItemsCount else {
//            return true
//        }
//        return self.items.count < totalItemsCount
//    }
//    
//    public func getNews() -> Completable {
//        return .deferred {
//            self.cancelLoading()
//            self.isLoadingInProcess = true
//            var currentPage = 1
//            return self.gateway.getPhotos(type, currentPage, self.limit, nameForSearch)
//                .do(onSuccess: { (result: PaginationEntity<PhotoItemEntity>) in
//                    switch type {
//                    case .new:
//                        self.currentNewPage += 1
//                        self.totalNewItemsCount = result.totalItems
//                        self.itemsNew.append(contentsOf: result.data)
//                        self.source.onNext((type, self.itemsNew))
//                        
//                    case .popular:
//                        self.currentPopularPage += 1
//                        self.totalPopularItemsCount = result.totalItems
//                        self.itemsPopular.append(contentsOf: result.data)
//                        self.source.onNext((type, self.itemsPopular))
//                    }
//                    self.isLoadingInProcess = false
//                }, onError: { error in
//                    self.isLoadingInProcess = false
//                    print("PaginationSourceUseCase: catch error =", error.localizedDescription)
//                })
//                .asCompletable()
//        }
//    }
//    
//    public func getUserPhotos(userId: Int? = nil) -> Completable {
//        return .deferred {
//            self.cancelLoading()
//            self.isLoadingInProcess = true
//            self.limit = 20
//            return self.gateway.getUserPhotos(self.currentPage, self.limit, userId)
//                .do(onSuccess: { (result: PaginationEntity<PhotoItemEntity>) in
//                    self.currentPage += 1
//                    self.totalItemsCount = result.totalItems
//                    self.items.append(contentsOf: result.data)
//                    self.isLoadingInProcess = false
//                    self.source.onNext((nil, self.items))
//                }, onError: { error in
//                    self.isLoadingInProcess = false
//                    print("PaginationSourceUseCase: catch error =", error.localizedDescription)
//                })
//                .asCompletable()
//        }
//    }
//    
//    public func resetItems(type: PhotoType?) {
//        switch type {
//        case .new:
//            self.itemsNew.removeAll()
//            self.totalNewItemsCount = nil
//            self.currentNewPage = 1
//            
//        case .popular:
//            self.itemsPopular.removeAll()
//            self.totalPopularItemsCount = nil
//            self.currentPopularPage = 1
//            
//            //этот тип используется при загрузке фоток пользователя по id, там как раз нет параметров new/popular
//        default:
//            self.items.removeAll()
//            self.totalItemsCount = nil
//            self.currentPage = 1
//        }
//    }
//    
//    private func cancelLoading() {
//        requestsBag = DisposeBag()
//    }
//    
//}

