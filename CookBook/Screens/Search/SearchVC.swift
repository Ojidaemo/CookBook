
import UIKit

final class SearchVC: UIViewController {
    
    private let searchView = SearchView()
    private let preloadManagerDelegate = PreloadData()
    
    override func viewDidAppear(_ animated: Bool) {  //тут после загрузки view получил данные и обновил таблицу
        preloadManagerDelegate.configure()
        searchView.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        preloadManagerDelegate.configure()
        searchView.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        preloadManagerDelegate.configure() //не определился в каком месте лучше получать данные и обновлять таблицу, поэтому ещё и сюда пихнул. В идеале в одном месте где-то это делать.
        searchView.tableView.reloadData()
        view.backgroundColor = .secondarySystemBackground
        searchView.tableView.delegate = self
        searchView.tableView.dataSource = self
        setUpView()
    }
    
    private func setUpView() {
        view.addSubview(searchView)
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            searchView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return preloadManagerDelegate.randomRecipesArray.first?.recipes?.count ?? 1   //проверял получение кол-ва ячеек по кол-ву объектов из массива
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! CustomHeader
        view.title.text = "Results"
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeCell.identifier, for: indexPath) as! RecipeCell
        if let recipe = preloadManagerDelegate.randomRecipesArray.first?.recipes?[indexPath.row] {
            cell.configure(recipe)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeCell.identifier, for: indexPath) as! RecipeCell
//        let bgColorView = UIView()
//        bgColorView.backgroundColor = .white
//        bgColorView.layer.cornerRadius = 15
//        cell.selectedBackgroundView = bgColorView
        let vc = DetailedRecipeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
