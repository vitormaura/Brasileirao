//
//  EventsViewController.swift
//  Brasileirao
//
//  Created by Vitor Maura on 02/10/20.
//

import UIKit

class EventsViewController: UIViewController {
    //MARK: - VARIABLES -
    lazy var viewData = EventsViewData()
    lazy var service = EventsService()
    lazy var dataBase = EventsDatabase()
    lazy var interactor = EventsInteractor(service: service, dataBase: dataBase)
    weak var coordinator: EventsCoordinator?
    var presenter: EventsPresenter?
   
    //MARK: - CONSTANTS -
    let cardView: CardView = {
        let cardView = CardView()
        cardView.accessibilityIdentifier = Identifiers.cardViewEvents
        return cardView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.alpha = 0
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.accessibilityIdentifier = Identifiers.eventsTable
        return tableView
    }()
    
    let errorView: ErrorView = {
        let view = ErrorView()
        view.alpha = 0
        view.backgroundColor = .clear
        return view
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.alpha = 0
        activityIndicator.color = .systemGreen
        activityIndicator.startAnimating()
        return activityIndicator
    }()
}

//MARK: - LIFE CYCLE -
extension EventsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewController()
        self.addAllSubviews()
        self.setupAllConstraints()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.coordinator?.didFinishEvents()
    }
}

//MARK: - UI FUNCTIONS -
extension EventsViewController {
    private func addAllSubviews() {
        self.view.addSubview(self.cardView)
        self.view.addSubview(self.contentView)
        self.contentView.addSubview(self.tableView)
        self.contentView.addSubview(self.activityIndicator)
        self.contentView.addSubview(self.errorView)
    }
    
    private func setupAllConstraints() {
        self.setupContentViewConstraints()
        self.setupCardViewConstraints()
        self.setupTableViewConstraints()
        self.setupErrorViewConstraints()
        self.setupActivityIndicatorConstraints()
    }
    
    private func setupCardViewConstraints() {
        self.cardView.translatesAutoresizingMaskIntoConstraints = false
        self.cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.cardView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        self.cardView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        self.cardView.heightAnchor.constraint(equalToConstant: 140).isActive = true
    }
    
    private func setupContentViewConstraints() {
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.topAnchor.constraint(equalTo: self.cardView.bottomAnchor).isActive = true
        self.contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupTableViewConstraints() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10).isActive = true
    }
    
    private func setupErrorViewConstraints() {
        self.errorView.translatesAutoresizingMaskIntoConstraints = false
        self.errorView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 50).isActive = true
        self.errorView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 50).isActive = true
        self.errorView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -150).isActive = true
        self.errorView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor,constant: -50).isActive = true
    }
    
    private func setupActivityIndicatorConstraints() {
        self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.activityIndicator.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.activityIndicator.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor,constant: -50).isActive = true
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
extension EventsViewController {
    private func setupViewController() {
        self.setupTableView()
        self.setupMatchViewData()
        self.view.backgroundColor = .systemBackground
        self.view.accessibilityIdentifier = Identifiers.eventsView
        self.errorView.reloadAction = { [weak self] in
            self?.presenter?.getEvents(matchId: self?.viewData.match.matchId ?? "0") }
        self.presenter = EventsPresenter(output: self, eventsInteractor: interactor)
        self.interactor.output = presenter
        self.presenter?.getEvents(matchId: self.viewData.match.matchId)
    }
    
    private func setupMatchViewData() {
        self.cardView.dateLabel.text = self.viewData.match.eventDate
        self.cardView.homeTeamNameLabel.text = self.viewData.match.homeTeamName
        self.cardView.homeTeamScoreLabel.text = self.viewData.match.homeTeamScore
        self.cardView.homeTeamImage.loadImage(urlString: self.viewData.match.homeTeamLogoUrl)
        self.cardView.awayTeamNameLabel.text = self.viewData.match.awayTeamName
        self.cardView.awayTeamScoreLabel.text = self.viewData.match.awayTeamScore
        self.cardView.awayTeamImage.loadImage(urlString: self.viewData.match.awayTeamLogoUrl)
        self.cardView.venueNameLabel.text = self.viewData.match.venue
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(EventTableViewCell.self, forCellReuseIdentifier: "eventCell")
    }
    
    private func reloadViewData(viewData: EventsViewData) {
        self.viewData.events = viewData.events
        self.tableView.reloadData()
    }
}

//MARK: - PRESENTER OUTPUT -
extension EventsViewController: EventsPresenterOutput {
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
    
    func setViewData(viewData: EventsViewData) {
        DispatchQueue.main.async {
            self.reloadViewData(viewData: viewData)
        }
    }
    
    func setViewDataFromDB(viewData: EventsViewData) {
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
extension EventsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewData.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventTableViewCell
        let event = self.viewData.events[indexPath.row]
        cell.setupViewData(viewData: event)
        cell.layoutIfNeeded()
        self.tableViewAnimate(view: cell.eventView, index: indexPath.row)
        return cell
    }
}

//MARK: - UITABLEVIEW DELEGATE -
extension EventsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
