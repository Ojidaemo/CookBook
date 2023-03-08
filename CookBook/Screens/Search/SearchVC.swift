import UIKit

final class SearchVC: UIViewController {
    
    private let searchView = SearchView()
    private let resipesByTypeDelegate: RestAPIProviderProtocol = RecipesManager()
    var searchArray: [Result] = []
    var currentRicepsArray: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        searchView.tableView.delegate = self
        searchView.tableView.dataSource = self
        searchView.searchBar.delegate = self
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
    
    func search(for searchText: String) {
        print("Searching for '\(searchText)'...")
        
        resipesByTypeDelegate.getRecipesByKey(forKey: searchText) { [weak self] recipesData in
            guard let self = self else { return }
            if let recivedData = recipesData.results {
                self.searchArray.append(contentsOf: recivedData)
                print("!!!!!!! searchArray =", self.searchArray)
                DispatchQueue.main.async {
                    self.searchView.tableView.reloadData()
                }
            }
        }
    }
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchArray.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! CustomHeader
        view.title.text = "Results"
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeCell.identifier, for: indexPath) as! RecipeCell
        let recipe = searchArray[indexPath.row]
        cell.configure(recipe)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailedRecipeViewController()
        let selectedID = searchArray[indexPath.row].id
        resipesByTypeDelegate.getCurrentRecipesByID(forID: selectedID) { [weak self] recipesData in
            guard let self = self else { return }
            let recivedData = recipesData
            self.currentRicepsArray.append(recivedData)
            DispatchQueue.main.async {
                vc.contentView.configure(self.currentRicepsArray)
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
        self.currentRicepsArray.removeAll()
    }
}

extension SearchVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            search(for: searchText)
        }
        searchBar.resignFirstResponder()
    }
}
