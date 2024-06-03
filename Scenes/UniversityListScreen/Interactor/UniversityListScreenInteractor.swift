//
//  UniversityListScreenInteractor.swift
//
//  Created by AhmedFitoh on 6/2/24.
//  
//

import Foundation

class UniversityListScreenInteractor {
    
    // MARK: - VIPER Stack
    weak var presenter: UniversityListScreenInteractorToPresenterProtocol!

    var webService: WebService
    init(webService: WebService = WebService()) {
        self.webService = webService
    }
    
    private func fetchFromApi() {
        let country = "United Arab Emirates"
        webService.request(.searchIn(country: country)) { [weak self] data in
            guard let data = data else {
                self?.fetchFromLocalDatabase()
                return
            }

            if let model = try? JSONDecoder().decode([University].self, from: data){
                self?.presenter?.fetchUniversityListSuccess(list: model)
                self?.cacheUniversity(list: model)
            } else {
                self?.fetchFromLocalDatabase()
            }
        } failure: {[weak self] error in
            self?.fetchFromLocalDatabase(previousError: error)
        }
    }
    
    private func fetchFromLocalDatabase(previousError: Error? = nil) {
        let cachedList = PersistenceManager.shared.retrieveUniversityList()
        if cachedList.isEmpty {
            if let previousError = previousError {
                presenter?.fetchUniversityListError(error: previousError)
            }else {
                presenter?.fetchUniversityListError(error: CustomError.generalError)
            }
        } else {
            presenter?.fetchUniversityListSuccess(list: cachedList)
        }
    }
    
    private func cacheUniversity(list: [University]) {
        PersistenceManager.shared.saveUniversity(list: list)
    }
}

// MARK: - Presenter To Interactor Protocol
extension UniversityListScreenInteractor: UniversityListScreenPresenterToInteractorProtocol {
    func fetchUniversities() {
            fetchFromApi()
    }
}
