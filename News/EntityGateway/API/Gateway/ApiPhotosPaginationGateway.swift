//
//  ApiNewsPaginationGateway.swift
//  Sanatorium
//
//  Created by Станислав Миненко on 24.02.2021.
////
//
//import Foundation
//import RxSwift
//import RxNetworkApiClient
//
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
