import UIKit


class MoviesViewController: UIViewController {
        
    var interactor: MoviesInteractorProtocol?
    var dataSource: MoviesDataSource?
    var router: MoviesRoutingProtocol?
    
    private lazy var categoriesTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        
        tableView.register(GenresTableViewCell.self,
                           forCellReuseIdentifier: GenresTableViewCell.identifier)
        tableView.register(HeaderViewCell.self,
                           forCellReuseIdentifier: HeaderViewCell.identifider)
        return tableView
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        interactor?.getGenres()
    }
   
    
    private func configureUI() {
        view.backgroundColor = .black
        
        configureTableView()
        configureNavbar()
    }
    
    
    private func configureTableView() {
        
        view.addSubview(categoriesTableView)

        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: BaseHelper.getHeight() * 0.4))
        
        categoriesTableView.tableHeaderView = headerView
        categoriesTableView.scrollIndicatorInsets = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0);

        if #available(iOS 11.0, *) {
            categoriesTableView.contentInsetAdjustmentBehavior = .never
        } else {
           automaticallyAdjustsScrollViewInsets = false
        }
    }
    private func configureNavbar() {
        navigationItem.title = "Filmler"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
                                                image: UIImage(systemName: "arrow.left"),
                                                style: .done,
                                                target: self,
                                                action: nil
        )
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
                                                image: UIImage(systemName: "magnifyingglass"),
                                                style: .done,
                                                target: self,
                                                action: nil
        )
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        categoriesTableView.frame = view.bounds
    }
}

extension MoviesViewController: MoviesViewControllerProtocol {

    func displayGenres(moviesDataSource: MoviesDataSource) {
        DispatchQueue.main.async {
            self.categoriesTableView.dataSource = moviesDataSource
            self.categoriesTableView.delegate = moviesDataSource
            self.dataSource = moviesDataSource
            self.dataSource?.delegate = self
            self.categoriesTableView.reloadData()
        }
    }
    
    func updateMoviesAtSection(_ movies: [Movie], indexPath: IndexPath) {
        DispatchQueue.main.async {
            let cell = self.categoriesTableView.cellForRow(at: indexPath) as? GenresTableViewCell
            cell?.configureCell(movies: movies)
        }
    }
}

extension MoviesViewController: MoviesDataSourceDelegate {
    
    func fetchSectionItems(id: Int, indexPath: IndexPath) {
        interactor?.getMoviesAtSection(id: id, indexPath: indexPath)
    }
    
    func movieSelected(movie: Movie) {
        router?.navigateToMovieDetailsController(movie)
    }
}
