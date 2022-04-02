//
//  NewsGateway.swift
//  News
//
//  Created by Юлия on 02.04.2022.
//

import Foundation
import RxSwift

protocol NewsGateway {
    func getNewsCategories() -> Single<NewsCategoryList>
    func getNewsList(for categoryId: Int, page: Int) -> Single<PaginationEntity<NewsShortInfo>>
    func getNewsDetail(for id: Int) -> Single<NewsDetailInfo>
}
