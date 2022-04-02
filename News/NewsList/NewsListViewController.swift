import UIKit

class NewsListViewController: UIViewController, NewsListView {
    internal var presenter: NewsListPresenter!
    @IBOutlet var newsListTableView: UITableView!
    var newsItems: [NewsShortInfo]? {
        self.presenter.newsItems
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.presenter.viewDidLoad()
    }
    
    func setupTableView() {
        self.newsListTableView.delegate = self
        self.newsListTableView.dataSource = self
        self.newsListTableView.tableFooterView = UIView(frame: .zero)
    }
    
    func reloadTableView() {
        self.newsListTableView.reloadData()
    }
}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        self.newsItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.newsListTableView.dequeueReusableCell(
            withIdentifier: R.reuseIdentifier.listCell,
            for: indexPath)!
        
        let info = self.newsItems?[indexPath.row]
        cell.setupCell(with: info)
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        150.0
    }
    
    func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let newsItemId = self.newsItems?[indexPath.row].id else {
            return
        }
        self.presenter.openNewsDetail(for: newsItemId)
    }
    
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        if let itemsCount = newsItems?.count,
           indexPath.row == itemsCount - 1 {
            self.presenter.getNews(for: self.presenter.categoryId)
        }
    }
}

