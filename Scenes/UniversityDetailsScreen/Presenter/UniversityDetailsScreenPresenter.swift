//
//  UniversityDetailsScreenPresenter.swift
//
//  Created by AhmedFitoh on 6/2/24.
//  
//

import Foundation

class UniversityDetailsScreenPresenter {
    
    // MARK: - VIPER Stack
    weak var view: UniversityDetailsScreenPresenterToViewProtocol!
    var interactor: UniversityDetailsScreenPresenterToInteractorProtocol!
    var wireframe: UniversityDetailsScreenPresenterToWireframeProtocol!
    
    // MARK: - Instance Variables
    weak var delegate: UniversityDetailsScreenDelegate?
    var university: University
    
    // MARK: - Life Cycle
    init(university: University,
        wireframe: UniversityDetailsScreenPresenterToWireframeProtocol,
         view: UniversityDetailsScreenPresenterToViewProtocol,
         interactor: UniversityDetailsScreenPresenterToInteractorProtocol,
         delegate: UniversityDetailsScreenDelegate? = nil) {
        self.university = university
        self.wireframe = wireframe
        self.interactor = interactor
        self.view = view
        self.delegate = delegate
    }
}

// MARK: - Interactor to Presenter Protocol
extension UniversityDetailsScreenPresenter: UniversityDetailsScreenInteractorToPresenterProtocol {
    
}

// MARK: - View to Presenter Protocol
extension UniversityDetailsScreenPresenter: UniversityDetailsScreenViewToPresenterProtocol {
    func viewDidLoad() {
        view?.populateUniversityInformation(university)
    }
    
    func didTapRefreshButton() {
        delegate?.refreshUniversityList()
        wireframe?.dismiss()
    }
}
