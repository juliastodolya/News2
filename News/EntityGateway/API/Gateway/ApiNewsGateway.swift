//
//  ApiNewsGateway.swift
//  News
//
//  Created by Юлия on 02.04.2022.
//

import Foundation
import RxSwift
import RxNetworkApiClient

//class ApiPhotosPaginationGateway: ApiBaseGateway, PhotosPaginationGateway {
//    func getUserPhotos(_ page: Int, _ limit: Int, _ userId: Int?) -> Single<PaginationEntity<PhotoItemEntity>> {
//        self.apiClient.execute(request: ExtendedApiRequest.getUserPhotos(page, limit, userId))
//    }
//
//    func getPhotos(_ type: PhotoType, _ page: Int, _ limit: Int, _ nameForSearch: String?) -> Single<PaginationEntity<PhotoItemEntity>> {
//        self.apiClient.execute(request: ExtendedApiRequest.getPhotos(type, page, limit, nameForSearch))
//    }
//
//    func createPost(gallery: UploadEntity) -> Single<FileEntity> {
//        self.apiClient.execute(request: ExtendedApiRequest.uploadGallery(gallery: gallery))
//    }
//
//}

class ApiNewsGateway: ApiBaseGateway, NewsGateway {//, NewsPaginationGateway {
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
