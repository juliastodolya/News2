//
//  NewsCategoriesConfigurator.swift
//  News
//
//  Created by Юлия on 02.04.2022.
//

import UIKit

class NewsCategoriesConfigurator {
    func configure(view: NewsCategoriesViewController) {
        let router = NewsCategoriesRouter(view)
        let presenter = NewsCategoriesPresenterImp(view,
                                                   router,
                                                   DI.resolve())
        view.presenter = presenter
    }
    
    static func open() {
        guard let view = R.storyboard.newsCategories.category() else { return }
        NewsCategoriesConfigurator().configure(view: view)
        if let window = AppDelegate.shared.window {
            UIView.transition(with: window,
                              duration: 0.3,
                              options: .transitionCrossDissolve,
                              animations: {
                                window.rootViewController = view
                              })
        }
    }
}
