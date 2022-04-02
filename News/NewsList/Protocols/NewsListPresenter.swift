//
//  NewsListPresenter.swift
//  News
//
//  Created by Юлия on 02.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Cheeezcake Template Inc.
//

import Foundation

protocol NewsListPresenter {
    var newsItems: [NewsShortInfo] { get }
    var isLoadingInProcess: Bool { get }
    var categoryId: Int { get }
    
    func openNewsDetail(for id: Int?)
    func getNews(for categoryId: Int)
    func viewDidLoad()
}
