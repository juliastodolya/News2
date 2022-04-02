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
    
    func getNewsDetail(for id: Int) -> Single<NewsDetailInfo> {
        self.apiClient.execute(request: ExtendedApiRequest.getNewsDetail(for: id))
    }
}
