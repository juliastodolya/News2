import Foundation

protocol NewsCategoriesPresenter {
    var newsCategoryItems: [NewsCategory]? { get }
    
    func getCategories()
    func openNewsList(for categoryId: Int)
}
