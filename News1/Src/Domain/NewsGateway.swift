import Foundation
import RxSwift

protocol NewsGateway {
    func getNewsCategories() -> Single<NewsCategoryList>
    func getNewsList(for categoryId: Int, page: Int) -> Single<PaginationEntity<NewsShortInfo>>
    func getNewsDetails(for id: Int) -> Single<NewsDetailsEntity>
}
