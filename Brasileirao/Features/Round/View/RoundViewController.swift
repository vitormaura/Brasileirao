//
//  RoundViewController.swift
//  Brasileirao
//
//  Created by Vitor Maura on 01/10/20.
//

import UIKit

class RoundViewController: UIViewController {
    //MARK: - VARIABLES -
    lazy var viewData = RoundViewData()
    lazy var service = RoundService()
    lazy var dataBase = RoundDatabase()
    lazy var interactor = RoundInteractor(service: service, dataBase: dataBase)
    weak var coordinator: RoundCoordinator?
    var presenter: RoundPresenter?
    
    //MARK: - CONSTANTS -
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.alpha = 0
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.accessibilityIdentifier = Identifiers.roundTableView
        return tableView
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.alpha = 0
        activityIndicator.color = .systemGreen
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    let errorView: ErrorView = {
        let view = ErrorView()
        view.alpha = 0
        view.backgroundColor = .clear
        return view
    }()
        
    let refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .systemGreen
        return refreshControl
    }()
}

//MARK: - LIFE CYCLE -
extension RoundViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addAllSubviews()
        self.setupAllConstraints()
        self.setupViewController()
    }
}

//MARK: - UI FUNCTIONS -
extension RoundViewController {
    private func addAllSubviews() {
        self.view.addSubview(tableView)
        self.view.addSubview(self.activityIndicator)
        self.view.addSubview(self.errorView)
    }
    
    private func setupAllConstraints() {
        self.setupTableViewConstraints()
        self.setupActivityIndicatorConstraints()
        self.setupErrorViewConstraints()
    }
    
    private func setupTableViewConstraints() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    private func setupActivityIndicatorConstraints() {
        self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setupErrorViewConstraints() {
        self.errorView.translatesAutoresizingMaskIntoConstraints = false
        self.errorView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        self.errorView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70).isActive = true
        self.errorView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70).isActive = true
        self.errorView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -70).isActive = true
    }
        
    private func setStatusView(isLoading: Bool = false, isError: Bool = false) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.4) {
                self.activityIndicator.alpha = isLoading ? 1 : 0
                self.errorView.alpha = isError ? 1 : 0
                self.tableView.alpha = isLoading || isError ? 0 : 1
            }
        }
    }
    
    private func tableViewAnimate(view: UIView, index: Int) {
        view.alpha = 0
        UIView.animate(withDuration: 0.2, delay: 0.05 * Double(index), animations: {
            view.alpha = 1
        })
    }
}

//MARK: - AUX FUNCTIONS -
extension RoundViewController {
    private func setupViewController() {
        self.setupTableView()
        self.view.backgroundColor = .systemBackground
        self.view.accessibilityIdentifier = Identifiers.roundView
        self.errorView.reloadAction = { [weak self] in self?.presenter?.getRound() }
        self.presenter = RoundPresenter(output: self, roundInteractor: interactor)
        self.interactor.output = presenter
        self.presenter?.getRound()
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: #selector(reloadData), for: UIControl.Event.valueChanged)
        self.tableView.register(MatchTableViewCell.self, forCellReuseIdentifier: "matchCell")
    }
    
    private func reloadViewData(viewData: RoundViewData) {
        self.viewData = viewData
        self.tableView.reloadData()
    }
        
    @objc private func reloadData() {
        self.refreshControl.beginRefreshing()
        self.presenter?.getRound()
        self.refreshControl.endRefreshing()
    }
}

//MARK: - PRESENTER OUTPUT -
extension RoundViewController: RoundPresenterOutput {
    func startLoading() {
        DispatchQueue.main.async {
            self.setStatusView(isLoading: true)
        }
    }
    
    func stopLoading() {
        DispatchQueue.main.async {
            self.setStatusView(isLoading: false)
        }
    }
    
    func setViewData(viewData: RoundViewData) {
        DispatchQueue.main.async {
            self.reloadViewData(viewData: viewData)
        }
    }
    
    func setViewDataFromDB(viewData: RoundViewData) {
        DispatchQueue.main.async {
            self.reloadViewData(viewData: viewData)
            self.coordinator?.showAlert(viewController: self,
                                        refreshDate: viewData.refreshDate)
        }
    }
    
    func setError() {
        DispatchQueue.main.async {
            self.setStatusView(isError: true)
        }
    }
}

//MARK: - UITABLEVIEW DATASOURCE -
extension RoundViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewData.matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell", for: indexPath) as! MatchTableViewCell
        let matchViewData = self.viewData.matches[indexPath.row]
        cell.setupViewData(viewData: matchViewData)
        self.tableViewAnimate(view: cell.cardView, index: indexPath.row)
        return cell
    }
}

//MARK: - UITABLEVIEW DELEGATE -
extension RoundViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.coordinator?.showEventsMatch(matchViewData: self.viewData.matches[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
}
