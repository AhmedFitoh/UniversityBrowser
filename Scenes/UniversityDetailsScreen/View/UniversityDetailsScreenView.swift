//
//  UniversityDetailsScreenView.swift
//
//  Created by AhmedFitoh on 6/2/24.
//  
//

import UIKit

class UniversityDetailsScreenView: UIViewController {
    
    // MARK: - VIPER Stack
    var presenter: UniversityDetailsScreenViewToPresenterProtocol!
    
    // MARK: - Instance variables
    private var stackView: UIStackView!
    private var nameLabel: UILabel!
    private var stateProvinceStackView: UIStackView!
    private var stateProvinceLabel: UILabel!
    private var countryStackView: UIStackView!
    private var countryLabel: UILabel!
    private var alphaTwoCodeStackView: UIStackView!
    private var alphaTwoCodeLabel: UILabel!
    private var webpageStackView: UIStackView!
    private var webpageLabel: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupBackground()
        setupStackView()
        setupNameLabel()
        setupSpacer()
        setupStateProvinceStackView()
        setupStateProvinceLabel()
        setupCountryStackView()
        setupCountryLabel()
        setupCountryCodeStackView()
        setupCountryCodeLabel()
        setupWebpageStackView()
        setupWebpageLabel()
        setupConstraints()
        setupNavigationController()
    }
    
    private func setupBackground() {
        view.backgroundColor = .white
    }
    
    private func setupStackView() {
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        view.addSubview(stackView)
    }
    
    private func setupNameLabel() {
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameLabel.numberOfLines = 0
        stackView.addArrangedSubview(nameLabel)
    }
    
    private func setupSpacer() {
        let spacer = UIView()
        spacer.translatesAutoresizingMaskIntoConstraints = false
        spacer.heightAnchor.constraint(equalToConstant: 10).isActive = true
        stackView.addArrangedSubview(spacer)
    }
    
    private func setupStateProvinceStackView() {
        stateProvinceStackView = UIStackView()
        stateProvinceStackView.translatesAutoresizingMaskIntoConstraints = false
        stateProvinceStackView.axis = .horizontal
        stateProvinceStackView.distribution = .equalCentering
        stackView.addArrangedSubview(stateProvinceStackView)
    }
    
    private func setupStateProvinceLabel() {
        stateProvinceLabel = UILabel()
        stateProvinceLabel.translatesAutoresizingMaskIntoConstraints = false
        let stateTitleLabel = UILabel()
        stateTitleLabel.text = "University State"
        stateTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        stateProvinceStackView.addArrangedSubview(stateTitleLabel)
        stateProvinceStackView.addArrangedSubview(stateProvinceLabel)
    }
    
    private func setupCountryStackView() {
        countryStackView = UIStackView()
        countryStackView.translatesAutoresizingMaskIntoConstraints = false
        countryStackView.axis = .horizontal
        countryStackView.distribution = .equalCentering
        stackView.addArrangedSubview(countryStackView)
    }
    
    private func setupCountryLabel() {
        countryLabel = UILabel()
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        let countryTitleLabel = UILabel()
        countryTitleLabel.text = "Country"
        countryTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        countryStackView.addArrangedSubview(countryTitleLabel)
        countryStackView.addArrangedSubview(countryLabel)
    }
    
    private func setupCountryCodeStackView() {
        alphaTwoCodeStackView = UIStackView()
        alphaTwoCodeStackView.translatesAutoresizingMaskIntoConstraints = false
        alphaTwoCodeStackView.axis = .horizontal
        alphaTwoCodeStackView.distribution = .equalCentering
        stackView.addArrangedSubview(alphaTwoCodeStackView)
    }
    
    private func setupCountryCodeLabel() {
        alphaTwoCodeLabel = UILabel()
        alphaTwoCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        let alphaTwoCodeTitleLabel = UILabel()
        alphaTwoCodeTitleLabel.text = "Country Code"
        alphaTwoCodeTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        alphaTwoCodeStackView.addArrangedSubview(alphaTwoCodeTitleLabel)
        alphaTwoCodeStackView.addArrangedSubview(alphaTwoCodeLabel)
    }
    
    private func setupWebpageStackView() {
        webpageStackView = UIStackView()
        webpageStackView.translatesAutoresizingMaskIntoConstraints = false
        webpageStackView.axis = .horizontal
        webpageStackView.distribution = .equalCentering
        stackView.addArrangedSubview(webpageStackView)
    }
    
    private func setupWebpageLabel() {
        webpageLabel = UILabel()
        webpageLabel.textColor = .blue
        webpageLabel.isUserInteractionEnabled = true
        webpageLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openWebpage)))
        webpageLabel.translatesAutoresizingMaskIntoConstraints = false
        let webpageTitleLabel = UILabel()
        webpageTitleLabel.text = "Web Page"
        webpageTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        webpageStackView.addArrangedSubview(webpageTitleLabel)
        webpageStackView.addArrangedSubview(webpageLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh,
                                                            target: self,
                                                            action: #selector(refreshButton(_:)))
    }
    
    @objc
    private func openWebpage() {
        guard let url = URL(string: webpageLabel.text ?? "") else { return }
        UIApplication.shared.open(url)
    }
    
    @objc
    private func refreshButton(_ sender: Any) {
        presenter?.didTapRefreshButton()
    }
}

// MARK: - Presenter to View Protocol
extension UniversityDetailsScreenView: UniversityDetailsScreenPresenterToViewProtocol {
    func populateUniversityInformation(_ university: University) {
        nameLabel.text = university.name
        stateProvinceLabel.text = university.stateProvince
        countryLabel.text = university.country
        alphaTwoCodeLabel.text = university.alphaTwoCode
        webpageLabel.text = university.webPages.first
    }
}
