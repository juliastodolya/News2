//
//  NewsCategoriesPresenter.swift
//  News
//
//  Created by Юлия on 02.04.2022.
//

import Foundation

protocol NewsCategoriesPresenter {
    var newsCategoryItems: [NewsCategory]? { get }
    
    func getCategories()
    func openNewsList(for categoryId: Int)
}
