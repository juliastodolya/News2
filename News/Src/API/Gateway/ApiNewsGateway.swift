import Foundation
import RxSwift
import RxNetworkApiClient

class ApiNewsGateway: ApiBaseGateway, NewsGateway {
    func getNewsCategories() -> Single<NewsCategoryList> {
        self.apiClient.execute(request: ExtendedApiRequest.getNewsCategories())
    }

    func getNewsList(for categoryId: Int, page: Int) -> Single<PaginationEntity<NewsShortInfo>> {
        self.apiClient.execute(request: ExtendedApiRequest.getNewsList(for: categoryId, page: page))
    }

    func getNewsDetails(for id: Int) -> Single<NewsDetailsEntity> {
        self.apiClient.execute(request: ExtendedApiRequest.getNewsDetails(for: id))
    }
}
