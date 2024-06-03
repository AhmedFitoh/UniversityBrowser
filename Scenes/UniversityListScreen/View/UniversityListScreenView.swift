//
//  UniversityListScreenView.swift
//
//  Created by AhmedFitoh on 6/2/24.
//  


import UIKit

class UniversityListScreenView: UIViewController {
    
    // MARK: - VIPER Stack
    var presenter: UniversityListScreenViewToPresenterProtocol!
    
    // MARK: - Instance properites
    private let tableView = UITableView()
    private let loadingIndicator = UIActivityIndicatorView()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }

    // MARK: - Setup UI
    private func setupUI() {
        setupNavigationController()
        setupTableView()
        setupLoadingIndicator()
    }
    private func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Universities"
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.registerNib(cellType: UniversityTableCell.self)
    }
    
    private func setupLoadingIndicator() {
        view.addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadingIndicator.style = .large
    }
    
    func updateUniversityList() {
        tableView.reloadData()
    }
}

// MARK: - Presenter to View Protocol
extension UniversityListScreenView: UniversityListScreenPresenterToViewProtocol {
    func displayAlertWith(error: Error) {
        let alert = UIAlertController(title: nil,
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func startLoadingIndicator() {
        loadingIndicator.startAnimating()
    }

    func stopLoadingIndicator() {
        loadingIndicator.stopAnimating()
    }
}

// MARK: - UITableView dataSource
extension UniversityListScreenView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.universityList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UniversityTableCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setupCellWith(university: presenter.universityList [indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

// MARK: - UITableView delegate
extension UniversityListScreenView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectUniversity(at: indexPath.row)
    }
}
