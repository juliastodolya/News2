import Foundation

protocol NewsListPresenter {
    var newsItems: [NewsShortInfo] { get }
    var isLoadingInProcess: Bool { get }
    var categoryId: Int { get }
    
    func openNewsDetail(for id: Int?)
    func getNews(for categoryId: Int)
    func viewDidLoad()
}
