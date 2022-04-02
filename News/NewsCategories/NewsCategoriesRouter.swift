//
//  NewsCategoriesRouter.swift
//  News
//
//  Created by Юлия on 02.04.2022.
//

import UIKit

class NewsCategoriesRouter {
    private weak var view: NewsCategoriesViewController!

    init(_ view: NewsCategoriesViewController) {
        self.view = view
    }
    
    func openNewsList(for categoryId: Int) {
        guard let navigationController = self.view.navigationController else {
            return
        }
        NewsListConfigurator.open(navigationController: navigationController,
                                  categoryId: categoryId)
    }
}
