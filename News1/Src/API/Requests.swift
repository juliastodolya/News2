import Foundation
import RxNetworkApiClient
import RxSwift

extension ExtendedApiRequest {
    static func getNewsCategories() -> ExtendedApiRequest {
        return extendedRequest(path: "/v1/news/categories",
                               method: .get,
                               headers: [Header.contentJson])
    }

    static func getNewsList(for categoryId: Int, page: Int) -> ExtendedApiRequest {
        return extendedRequest(path: "/v1/news/categories/\(categoryId)/news",
                               method: .get,
                               headers: [Header.contentJson],
                               query: ("page", String(page)))
    }

    static func getNewsDetails(for id: Int) -> ExtendedApiRequest {
        return extendedRequest(path: "/v1/news/details",
                               method: .get,
                               headers: [Header.contentJson],
                               query: ("id", String(id)))
    }
}
