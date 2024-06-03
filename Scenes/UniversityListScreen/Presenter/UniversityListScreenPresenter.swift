//
//  UniversityListScreenPresenter.swift
//
//  Created by AhmedFitoh on 6/2/24.
//  
//

import Foundation

class UniversityListScreenPresenter {
    
    // MARK: - VIPER Stack
    weak var view: UniversityListScreenPresenterToViewProtocol!
    var interactor: UniversityListScreenPresenterToInteractorProtocol!
    var wireframe: UniversityListScreenPresenterToWireframeProtocol!
    
    // MARK: - Instance Variables
    weak var delegate: UniversityListScreenDelegate?
    var universityList: [University] = []

    // MARK: - Life Cycle
    init(wireframe: UniversityListScreenPresenterToWireframeProtocol,
         view: UniversityListScreenPresenterToViewProtocol,
         interactor: UniversityListScreenPresenterToInteractorProtocol,
         delegate: UniversityListScreenDelegate? = nil) {
        self.wireframe = wireframe
        self.interactor = interactor
        self.view = view
        self.delegate = delegate
    }

    private func loadUniversities() {
        view?.startLoadingIndicator()
        interactor?.fetchUniversities()
    }

}

// MARK: - Interactor to Presenter Protocol
extension UniversityListScreenPresenter: UniversityListScreenInteractorToPresenterProtocol {
    func fetchUniversityListSuccess(list: [University]) {
        universityList = list
        view?.updateUniversityList()
        view?.stopLoadingIndicator()
    }
    
    func fetchUniversityListError(error: Error) {
        view?.stopLoadingIndicator()
        view?.displayAlertWith(error: error)
    }
}

// MARK: - View to Presenter Protocol
extension UniversityListScreenPresenter: UniversityListScreenViewToPresenterProtocol {
    func viewDidLoad() {
        loadUniversities()
    }

    func didSelectUniversity(at index: Int) {
        wireframe?.navigateToDetailsScreenWith(university: universityList[index],
                                               delegate: self)
    }
}

// MARK: - Modules communication Protocol
extension UniversityListScreenPresenter: UniversityDetailsScreenDelegate{
    func refreshUniversityList() {
        loadUniversities()
    }
}
