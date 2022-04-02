import Foundation
import RxNetworkApiClient
import RxSwift

extension ExtendedApiRequest {
    
//    // MARK: - /oauth
//    static func loginRequest(_ username: String, _ password: String) -> ExtendedApiRequest {
//        let appVersion = Bundle.main.shortVersion
//
//        return extendedRequest(path: "/oauth/v2/token",
//                               method: .get,
//                               query: ("client_id", Config.clientId),
//                               ("client_secret", Config.clientSecret),
//                               ("grant_type", "password"),
//                               ("username", username),
//                               ("password", password),
//                               ("version", appVersion))
//    }
//
//    static func tokenRefreshRequest(_ refreshToken: String) -> ExtendedApiRequest {
//        return extendedRequest(path: "/oauth/v2/token",
//                               method: .post,
//                               formData: ["client_id": Config.clientId,
//                                          "client_secret": Config.clientSecret,
//                                          "grant_type": "refresh_token",
//                                          "refresh_token": refreshToken])
//    }
//
//    static func signUP(_ entity: SignUPEntity, _ locale: String) -> ExtendedApiRequest {
//        return extendedRequest(path: "/users",
//                               method: .post,
//                               headers: [Header.contentJson,
//                                         Header("localization", locale)],
//                               body: entity,
//                               query: ("lang", locale))
//    }
//
//    // MARK: - Photos
//    static func getPhotos(_ type: PhotoType, _ page: Int, _ limit: Int, _ nameForSearch: String?) -> ExtendedApiRequest {
//        var new: (String, String?)!
//        var popular: (String, String?)!
//        switch type {
//        case .new:
//            new = ("new", "true")
//            popular = ("popular", "false")
//        case .popular:
//            new = ("new", "false")
//            popular = ("popular", "true")
//        }
//        var queries: [(String, String?)] = [ ("page", String(page)),
//                                             ("limit", String(limit)),
//                                             new,
//                                             popular]
//
//        if let nameForSearch = nameForSearch {
//            queries.append(("name", String(nameForSearch)))
//        }
//
//        let newRequest: ExtendedApiRequest = extendedRequest(path: "/photos", method: .get)
//        newRequest.query = queries
//        return newRequest
//    }
//
//    static func getUserPhotos(_ page: Int, _ limit: Int, _ userId: Int?) -> ExtendedApiRequest {
//        var queries: [(String, String?)] = [ ("page", String(page)),
//                                             ("limit", String(limit)) ]
//
//        if let userId = userId {
//            queries.append(("user.id", String(userId)))
//        }
//        let newRequest: ExtendedApiRequest = extendedRequest(path: "/photos", method: .get)
//        newRequest.query = queries
//        return newRequest
//    }
//
//    // MARK: - UserInfo
//    static func getAccountRequest() -> ExtendedApiRequest {
//        return extendedRequest(path: "/users/current", method: .get)
//    }
//
//    static func updateUserInfo(_ userId: Int,
//                               _ user: UserApiEntity) -> ExtendedApiRequest {
//        return extendedRequest(path: "/users/\(userId)",
//                               method: .put,
//                               headers: [Header.contentJson],
//                               body: user)
//    }
//
//    static func deleteUser(_ userId: Int) -> ExtendedApiRequest {
//        return extendedRequest(path: "/users/\(userId)",
//                               method: .delete,
//                               headers: [Header.contentJson])
//    }
//
//    // MARK: - Password
//    static func updatePassword(_ userId: Int, _ entity: ChangePasswordEntity) -> ExtendedApiRequest {
//        return extendedRequest(path: "/users/update_password/\(userId)",
//                               method: .put,
//                               headers: [Header.contentJson],
//                               body: entity)
//    }
//
//    // MARK: - File
//    static func uploadFile(file: UploadFile) -> ExtendedApiRequest {
//        return extendedRequest(path: "/media_objects",
//                               method: .post,
//                               files: [file])
//    }
//
//    static func uploadGallery(gallery: UploadEntity) -> ExtendedApiRequest {
//        return extendedRequest(path: "/photos",
//                               method: .post,
//                               headers: [.contentJson],
//                               body: gallery)
//    }
//
//    // MARK: - Shiden
//    static func parseAccounts(accountPaginationEntity: AccountPaginationBodyEntity) -> ExtendedApiRequest {
//        return extendedRequest(path: "astar.api.subscan.io/api/scan/accounts",
//                               method: .post,
//                               headers: [Header("X-API-Key", "1e21323c468582a1700125d0db915252"),
//                                Header.contentJson],
//                               body: accountPaginationEntity)
//    }
//
//    static func getBalanceForAccounts(accountPaginationEntity: AccountCheckBodyEntity) -> ExtendedApiRequest {
//        return extendedRequest(path: "shiden.api.subscan.io/api/v2/scan/search",
//                               method: .post,
//                               headers: [Header("X-API-Key", "1e21323c468582a1700125d0db915252"),
//                                Header.contentJson],
//                               body: accountPaginationEntity)
//    }
    
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
    
    static func getNewsDetail(for id: Int) -> ExtendedApiRequest {
        return extendedRequest(path: "/v1/news/details",
                               method: .get,
                               headers: [Header.contentJson],
                               query: ("id", String(id)))
    }
}



