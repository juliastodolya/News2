import UIKit

class NewsCategoriesViewController: UIViewController,
                                    NewsCategoriesView {
    var presenter: NewsCategoriesPresenter!
    var categories: [NewsCategory]? {
        self.presenter.newsCategoryItems
    }
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewsCategoriesConfigurator().configure(view: self)
        self.setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter.getCategories()
    }
    
    func setupTableView() {
        self.categoryTableView.delegate = self
        self.categoryTableView.dataSource = self
        self.categoryTableView.tableFooterView = UIView(frame: .zero)
    }
    
    func reloadTableView() {
        self.categoryTableView.reloadData()
    }
}

extension NewsCategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        self.categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.categoryTableView.dequeueReusableCell(
            withIdentifier: R.reuseIdentifier.categoryCell,
            for: indexPath)!
        
        let name = self.categories?[indexPath.row].name
        cell.setupCell(with: name)
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
    
    func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let categoryId = self.categories?[indexPath.row].id else {
            return
        }
        self.presenter.openNewsList(for: categoryId)
    }
}
